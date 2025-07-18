defmodule DashElixirFlutter.Serial do
  use GenServer

  alias DashElixirFlutter.StreamDataBuilder
  alias DashElixirFlutter.StatusMotor
  alias DashElixirFlutter.EcuData
  alias DashElixirFlutter.SerialParser

  require Logger

  @usb_port "/dev/ttyUSB0"
  @bt_port "/dev/rfcomm0"

  @tick_interval 50
  @update_interval 50
  @reconnect_interval 1000
  @read_timeout 1000

  def start_link(opts \\ []), do: GenServer.start_link(__MODULE__, opts, name: __MODULE__)

  @impl true
  def init(_) do
    :timer.send_interval(@update_interval, :update_stream)

    {:ok,
     %{
       config: %{uart_pid: nil},
       ecu_data: %EcuData{
         seconds: 0.0,
         pulseWidth1: 0.0,
         pulseWidth2: 0.0,
         rpm: 0.0,
         advance: 0.0,
         squirt: 0.0,
         engine: %StatusMotor{
           motor_pronto: false,
           motor_em_partida: false,
           enriquecimento_partida: false,
           ciclo_aquecimento: false
         },
         afrtgt1: 0.0,
         afrtgt2: 0.0,
         wbo2_en1: 0.0,
         wbo2_en2: 0.0,
         barometer: 0.0,
         map: 0.0,
         mat: 0.0,
         coolant: 0.0,
         tps: 0.0,
         batteryVoltage: 0.0,
         afr1: 0.0,
         afr2: 0.0,
         knock: 0.0,
         egoCorrection1: 0.0,
         egoCorrection2: 0.0,
         airCorrection: 0.0,
         warmupEnrich: 0.0,
         accelEnrich: 0.0,
         tpsfuelcut: 0.0,
         baroCorrection: 0.0,
         gammaEnrich: 0.0,
         veCurr1: 0.0,
         veCurr2: 0.0,
         iacstep: 0.0,
         coldAdvDeg: 0.0,
         tpsDot: 0.0,
         mapDot: 0.0,
         dwell: 0.0,
         mafload: 0.0,
         fuelload: 0.0,
         fuelCorrection: 0.0,
         portStatus: 0.0,
         knockRetard: 0.0,
         eaeFuelCorr1: 0.0,
         egoV: 0.0,
         egoV2: 0.0,
         status1: 0.0,
         status2: 0.0,
         status3: 0.0,
         status4: 0.0,
         looptime: 0.0,
         status5: 0.0,
         tpsADC: 0.0,
         fuelload2: 0.0,
         ignload: 0.0,
         ignload2: 0.0,
         synccnt: 0.0,
         timing_err: 0.0,
         deltaT: 0.0,
         wallfuel1: 0.0,
        #  gpioadc0: 0.0,
        #  gpioadc1: 0.0,
        #  gpioadc2: 0.0,
        #  gpioadc3: 0.0,
        #  gpioadc4: 0.0,
        #  gpioadc5: 0.0,
        #  gpioadc6: 0.0,
        #  gpioadc7: 0.0,
        #  gpiopwmin0: 0.0,
        #  gpiopwmin1: 0.0,
        #  gpiopwmin2: 0.0,
        #  gpiopwmin3: 0.0,
        #  adc6: 0.0,
        #  adc7: 0.0,
         wallfuel2: 0.0,
         eaeFuelCorr2: 0.0,
         boostduty: 0.0,
         syncreason: 0.0,
         user0: 0.0,
         inj_adv1: 0.0,
         inj_adv2: 0.0,
         pulseWidth3: 0.0,
         pulseWidth4: 0.0,
         vetrim1curr: 0.0,
         vetrim2curr: 0.0,
         vetrim3curr: 0.0,
         vetrim4curr: 0.0,
         maf: 0.0,
         eaeload1: 0.0,
         afrload1: 0.0,
         rpmDot: 0.0,
         gpioport0: 0.0,
         gpioport1: 0.0,
         gpioport2: 0.0,
         cl_idle_targ_rpm: 0.0,
         maf_volts: 0.0,
         airtemp: 0.0,
         dwell_trl: 0.0,
         fuel_pct: 0.0,
         boost_targ: 0.0,
         ext_advance: 0.0,
         base_advance: 0.0,
         idle_cor_advance: 0.0,
         mat_retard: 0.0,
         flex_advance: 0.0,
         adv1: 0.0,
         adv2: 0.0,
         adv3: 0.0,
         revlim_retard: 0.0,
         nitrous_retard: 0.0,
         deadtime1: 0.0,
         n2o_addfuel: 0.0,
         portbde: 0.0,
         portam: 0.0,
         portt: 0.0,
         can_error_cnt: 0.0,
         can_error: 0.0,
         oil: 0.0,
         fuel: 0.0,
         runsecs: 0.0,
         start_retard: 0.0,
         connected: false
       }
     }, {:continue, :connect}}
  end

  @impl true
  def handle_continue(:connect, state) do
    serial_port =
      cond do
        File.exists?(@usb_port) -> @usb_port
        File.exists?(@bt_port) -> @bt_port
        true -> nil
      end

    with {:ok, uart_pid} <- Circuits.UART.start_link(),
         :ok <-
           Circuits.UART.open(uart_pid, serial_port,
             speed: 115_200,
             framing: {DashElixirFlutter.SizeFraming, max_length: 32000},
             active: false
           ) do
      Logger.info("UART started successfully! 🚀")
      schedule_tick()

      {:noreply, %{state | config: %{state.config | uart_pid: uart_pid}}}
    else
      {:error, _reason} ->
        # Logger.error("Failed to start UART: #{reason}")
        schedule_reconnect()
        {:noreply, state}
    end
  end

  @impl true
  def handle_info(:reconnect, state) do
    if state.config.uart_pid do
      Circuits.UART.flush(state.config.uart_pid, :both)
      Circuits.UART.close(state.config.uart_pid)
      Circuits.UART.stop(state.config.uart_pid)
    end

    {:noreply, %{state | config: %{state.config | uart_pid: nil}}, {:continue, :connect}}
  end

  def handle_info(:tick, %{config: %{uart_pid: uart_pid}} = state) when is_nil(uart_pid) do
    # Logger.warning("UART not initialized, skipping tick.")
    schedule_tick()
    {:noreply, state}
  end

  def handle_info(:tick, %{config: %{uart_pid: uart_pid}} = state) do
    # Limpar o buffer antes de cada envio
    Circuits.UART.flush(uart_pid, :both)
    # Comando 'A' para solicitar dados em tempo real
    Circuits.UART.write(uart_pid, <<?A>>)

    with {:ok, data} when data != <<>> <- Circuits.UART.read(uart_pid, @read_timeout),
         {:ok, data} <- SerialParser.parse_data(data) do
      # Logger.info("Dados recebidos com sucesso! 🚀")
      schedule_tick()

      {:noreply, %{state | ecu_data: Map.merge(state.ecu_data, data)}}
    else
      {:ok, _data} ->
        Logger.warning("Timeout ao ler dados.")
        schedule_tick()
        {:noreply, state}

      {:error, _reason} ->
        # Logger.error("Erro ao ler dados: #{reason}")
        schedule_tick()
        {:noreply, state}
    end
  end

  def handle_info(:update_stream, state) do
    StreamDataBuilder.update_fields(%{ecu_data: state.ecu_data})
    {:noreply, state}
  end

  defp schedule_reconnect(), do: Process.send_after(self(), :reconnect, @reconnect_interval)

  defp schedule_tick(), do: Process.send_after(self(), :tick, @tick_interval)
end
