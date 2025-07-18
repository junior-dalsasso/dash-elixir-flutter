defmodule DashElixirFlutter.Consumption do
  use GenServer

  require Decimal
  alias DashElixirFlutter.StreamDataBuilder
  alias DashElixirFlutter.ConsumptionData
  # alias DashElixirFlutter.StreamData
  alias DashElixirFlutter.AuxValues
  alias Circuits.GPIO
  require Logger

  @hall_sensor_pin 14
  @consumed_sensor_pin 15

  @update_interval 50

  @min_dist_to_save Decimal.new(10)

  # Velocidade de referência em m/s (40 km/h)
  @speed_reference Decimal.from_float(11.1111)

  # 80 ul per pulse * 625 pulses = 50 ML
  # @pulses_to_50_ml Decimal.new(625)
  # 80 ul per pulse * 125 pulses = 10 ML
  @pulses_to_10_ml Decimal.new(125)

  # convert ul to Liters
  @ul_to_L Decimal.div(80, 1_000_000)

  defstruct distance_gpio: 0,
            consumed_gpio: 0,
            pulses_per_meter: "0.19",
            distance_pulses: 0,
            consumed_pulses: 0,
            speed_pulses: 0,
            tuning_pulses: 0,
            hodometer: 0,
            trip: 0,
            hodometer_consumed: 0,
            trip_consumed: 0,
            current_speed: 0,
            last_speed_calc_at: nil,
            tuning_sensor: false

  def start_link(_opts), do: GenServer.start_link(__MODULE__, %__MODULE__{}, name: __MODULE__)

  def reset_trip(), do: GenServer.cast(__MODULE__, :reset_trip)
  def reset_hodometer(), do: GenServer.cast(__MODULE__, :reset_hodometer)
  def start_calibration(), do: GenServer.cast(__MODULE__, :start_calibration)

  @impl true
  def init(state) do
    # Cria as seeds caso necessário
    DashElixirFlutter.seeds()

    # Configura GPIOs
    {:ok, distance_gpio} = GPIO.open(@hall_sensor_pin, :input, pull_mode: :pulldown)
    GPIO.set_interrupts(distance_gpio, :rising)
    Logger.info("Hall sensor initialized on pin #{@hall_sensor_pin}")

    {:ok, consumed_gpio} = GPIO.open(@consumed_sensor_pin, :input, pull_mode: :pulldown)
    GPIO.set_interrupts(consumed_gpio, :rising)
    Logger.info("Consumption sensor initialized on pin #{@consumed_sensor_pin}")

    # Agenda tarefas periódicas
    :timer.send_interval(500, self(), :handle_distance_pulses)
    :timer.send_interval(500, self(), :handle_consumed_pulses)
    :timer.send_interval(100, self(), :handle_calculate_speed)
    :timer.send_interval(@update_interval, self(), :update_stream)

    Logger.info("Consumption started successfully! 🚀")

    {:ok,
     %{
       state
       | distance_gpio: distance_gpio,
         consumed_gpio: consumed_gpio,
         pulses_per_meter: AuxValues.get_by_key!("pulsesPerMeter").value,
         distance_pulses: AuxValues.get_by_key!("pulsesDistance").value,
         consumed_pulses: AuxValues.get_by_key!("pulsesConsume").value,
         hodometer: AuxValues.get_by_key!("distanceHodometer").value,
         trip: AuxValues.get_by_key!("distanceTrip").value,
         hodometer_consumed: AuxValues.get_by_key!("consumedHodometer").value,
         trip_consumed: AuxValues.get_by_key!("consumedTrip").value,
         current_speed: Decimal.new(0),
         last_speed_calc_at: System.monotonic_time(:millisecond)
     }}
  end

  @impl true
  def handle_info({:circuits_gpio, @hall_sensor_pin, _timestamp, _value}, state) do
    new_state = %{
      state
      | distance_pulses: Decimal.add(state.distance_pulses, 1),
        speed_pulses: Decimal.add(state.speed_pulses, 1)
    }

    new_state =
      if state.tuning_sensor do
        %{new_state | tuning_pulses: Decimal.add(new_state.tuning_pulses, 1)}
      else
        new_state
      end

    # Logger.warning("Hall sensor pulse detected! Current count: #{new_state.speed_pulses}")
    {:noreply, new_state}
  end

  def handle_info({:circuits_gpio, @consumed_sensor_pin, _timestamp, _value}, state) do
    # Logger.warning("Consumption sensor pulse detected! Current count: #{state.consumed_pulses}")
    {:noreply, %{state | consumed_pulses: Decimal.add(state.consumed_pulses, 1)}}
  end

  def handle_info(:handle_distance_pulses, state) when state.distance_pulses == 0, do: state
  def handle_info(:handle_consumed_pulses, state) when state.consumed_pulses == 0, do: state

  def handle_info(:handle_distance_pulses, state) do
    stored_pulses = AuxValues.get_by_key!("pulsesDistance")
    distance_meters = Decimal.mult(state.distance_pulses, state.pulses_per_meter)

    state =
      if Decimal.gte?(distance_meters, @min_dist_to_save) do
        distance_km = Decimal.div(distance_meters, 1000)

        %{
          state
          | distance_pulses: Decimal.new(0),
            hodometer: Decimal.add(state.hodometer, distance_km),
            trip: Decimal.add(state.trip, distance_km)
        }
        |> tap(fn _ -> AuxValues.increase_distances!(distance_km) end)
      else
        state
      end

    if stored_pulses.value != state.distance_pulses do
      AuxValues.update_parameter!(stored_pulses, %{value: state.distance_pulses})
    end

    {:noreply, state}
  end

  def handle_info(:handle_consumed_pulses, state) do
    stored_pulses = AuxValues.get_by_key!("pulsesConsume")

    state =
      if Decimal.gte?(state.consumed_pulses, @pulses_to_10_ml) do
        consumed_in_l = Decimal.mult(state.consumed_pulses, @ul_to_L)

        %{
          state
          | consumed_pulses: Decimal.new(0),
            hodometer_consumed: Decimal.add(state.hodometer_consumed, consumed_in_l),
            trip_consumed: Decimal.add(state.trip_consumed, consumed_in_l)
        }
        |> tap(fn _ -> AuxValues.increase_consumptions!(consumed_in_l) end)
      else
        state
      end

    if stored_pulses.value != state.consumed_pulses do
      AuxValues.update_parameter!(stored_pulses, %{value: state.consumed_pulses})
    end

    {:noreply, state}
  end

  def handle_info(:handle_calculate_speed, %{speed_pulses: 0} = state) do
    now = System.monotonic_time(:millisecond)
    time_diff_seconds = (now - state.last_speed_calc_at) / 1000.0

    state =
      if time_diff_seconds >= 2 do
        %{state | current_speed: Decimal.new(0)}
      else
        state
      end

    {:noreply, state}
  end

  def handle_info(:handle_calculate_speed, %{pulses_per_meter: 0} = state) do
    {:noreply, %{state | current_speed: Decimal.new(0), speed_pulses: 0}}
  end

  def handle_info(:handle_calculate_speed, state) do
    now = System.monotonic_time(:millisecond)
    time_diff_seconds = (now - state.last_speed_calc_at) / 1000.0

    state =
      if time_diff_seconds >= 0.4 do
        current_ppm = Decimal.mult(state.speed_pulses, state.pulses_per_meter)
        scale = Decimal.div(Decimal.from_float(3.6), Decimal.from_float(time_diff_seconds))
        new_speed = Decimal.mult(current_ppm, scale)

        alpha = 0.2 # Peso da leitura nova

        smoothed_speed =
          Decimal.add(
            Decimal.mult(Decimal.from_float(alpha), new_speed),
            Decimal.mult(Decimal.from_float(1.0 - alpha), state.current_speed)
          )

        %{state | last_speed_calc_at: now, current_speed: smoothed_speed, speed_pulses: 0}
      else
        state
      end

    {:noreply, state}
  end

  def handle_info(:check_calibration, state) do
    state = try_calibrate(state)
    {:noreply, state}
  end

  def handle_info(:update_stream, state) do
    hodometer_fuel_by_distance = safe_ratio(state.hodometer, state.hodometer_consumed)
    trip_fuel_by_distance = safe_ratio(state.trip, state.trip_consumed)

    StreamDataBuilder.update_fields(%{
      consumption_data: %ConsumptionData{
        hodometer: Decimal.to_float(state.hodometer),
        trip: Decimal.to_float(state.trip),
        hodometer_consumed: Decimal.to_float(state.hodometer_consumed),
        trip_consumed: Decimal.to_float(state.trip_consumed),
        current_speed: Decimal.to_float(state.current_speed),
        hodometer_fuel_by_distance: Decimal.to_float(hodometer_fuel_by_distance),
        trip_fuel_by_distance: Decimal.to_float(trip_fuel_by_distance)
      }
    })

    {:noreply, state}
  end

  @impl true
  def handle_cast(:reset_hodometer, state) do
    AuxValues.reset_hodometer!()
    {:noreply, %{state | hodometer: Decimal.new(0), hodometer_consumed: Decimal.new(0)}}
  end

  def handle_cast(:reset_trip, state) do
    AuxValues.reset_trip!()
    {:noreply, %{state | trip: Decimal.new(0), trip_consumed: Decimal.new(0)}}
  end

  def handle_cast(:start_calibration, state) do
    :timer.send_after(1000, self(), :check_calibration)
    {:noreply, %{state | tuning_sensor: true, tuning_pulses: 0}}
  end

  defp try_calibrate(%{tuning_pulses: 0} = state) do
    %{state | tuning_sensor: false, tuning_pulses: 0}
  end

  defp try_calibrate(state) do
    new_ppm = Decimal.div(@speed_reference, state.tuning_pulses)

    if Decimal.eq?(state.pulses_per_meter, new_ppm) do
      %{state | tuning_sensor: false, tuning_pulses: 0}
    else
      pulsesPerMeter = AuxValues.get_by_key!("pulsesPerMeter")
      AuxValues.update_parameter!(pulsesPerMeter, %{value: new_ppm})
      %{state | pulses_per_meter: new_ppm, tuning_sensor: false, tuning_pulses: 0}
    end
  end

  defp safe_ratio(a, b) do
    if Decimal.eq?(a, 0) or Decimal.eq?(b, 0),
      do: Decimal.new(0),
      else: Decimal.div(a, b)
  end
end
