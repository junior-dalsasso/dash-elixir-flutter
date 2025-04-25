defmodule DashElixirFlutter.Serial do
  alias DashElixirFlutter.SerialParser
  require Logger
  use GenServer

  def start_link(opts), do: GenServer.start_link(__MODULE__, opts, name: __MODULE__)

  @impl true
  def init(:ok) do
    {:ok, uart_pid} = Circuits.UART.start_link()

    Circuits.UART.configure(uart_pid,
      framing: {DashElixirFlutter.SizeFraming, max_length: 32000},
      active: true
    )

    # Inicializa o INA219
    ina219_state =
      if Nerves.Runtime.mix_target() != :host do
        case INA219.open("i2c-1", addr: 0x42) do
        {:ok, state} -> state
        {:error, reason} ->
          Logger.error("Failed to initialize INA219: #{inspect(reason)}")
          nil
        end
      else
        nil
      end

    case Circuits.UART.open(uart_pid, "/dev/ttyUSB0", speed: 115_200, active: true) do
      :ok ->
        # Logger.error("Conexão realizada com sucesso!")
        :timer.send_interval(300, :tick)
        {:ok, %{uart: uart_pid, ina219: ina219_state}}

      {:error, _reason} ->
        :timer.send_interval(1000, :error)
        {:ok, %{uart: nil, ina219: ina219_state}}
    end
  end

  @impl true
  def handle_info(:tick, state) do
    Circuits.UART.flush(state.uart, :both)    # Limpar o buffer antes de cada envio
    Circuits.UART.write(state.uart, <<?A>>)   # Comando 'A' para solicitar dados em tempo real

    {:noreply, state}
  end

  def handle_info(:error, state) do
    rpi_battery_perc =
      if Nerves.Runtime.mix_target() != :host do
        case get_battery_data(state.ina219) do
          {:ok, battery_perc} -> battery_perc
          _ -> 0
        end
      else
        0
      end

    ecu_data = %{
      map_kpa: 0,
      map_bar: 0,
      map_psi: 0,
      mat_celsius: 0,
      battery_voltage: 0,
      rpm: 0,
      coolant: 0,
      tps: 0,
      rpi_battery_perc: rpi_battery_perc,
      connected: false
    }

    if Process.whereis(DashElixirFlutter.StreamServer) do
      send(DashElixirFlutter.StreamServer, {:ecu_data, ecu_data})
    end

    init(:ok)
    {:noreply, %{uart: nil, ina219: state.ina219}}
  end

  def handle_info({:circuits_uart, _port, data}, %{ina219: ina219} = state) do
    case SerialParser.parse_data(data) do
      {:ok, parsed_data} ->
        {:ok, battery_perc} = get_battery_data(ina219)

        ecu_data = %{
          map_kpa: parsed_data.map_kpa,
          map_bar: parsed_data.map_bar,
          map_psi: parsed_data.map_psi,
          mat_celsius: parsed_data.mat_celsius,
          battery_voltage: parsed_data.battery_voltage,
          rpm: parsed_data.rpm,
          coolant: parsed_data.coolant,
          tps: parsed_data.tps,
          rpi_battery_perc: battery_perc,
          connected: true
        }

        if Process.whereis(DashElixirFlutter.StreamServer) do
          send(DashElixirFlutter.StreamServer, {:ecu_data, ecu_data})
        end
        {:noreply, state}

      :error -> {:error, state}
    end
  end

  defp get_battery_data(nil), do: %{battery_percentage: nil}

  defp get_battery_data(ina219) do
    case INA219.get_battery_percentage(ina219) do
      {:ok, {percentage, _new_state}} ->
        {:ok, percentage}
      {:error, reason} ->
        Logger.error("Failed to read battery percentage: #{inspect(reason)}")
        {:error, reason}
    end
  end
end
