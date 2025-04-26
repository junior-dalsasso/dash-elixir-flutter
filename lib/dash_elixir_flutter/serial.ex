defmodule DashElixirFlutter.Serial do
  use GenServer

  alias DashElixirFlutter.RpiInfo
  alias DashElixirFlutter.StreamData
  alias DashElixirFlutter.EcuData
  alias DashElixirFlutter.AuxFuncs
  alias DashElixirFlutter.SerialParser

  require Logger

  @usb_port "/dev/ttyUSB0"
  @bt_port "/dev/rfcomm0"

  @tick_interval 500
  @update_interval 500
  @reconnect_interval :timer.seconds(1)
  @read_timeout :timer.seconds(1)

  def start_link(opts \\ []), do: GenServer.start_link(__MODULE__, opts, name: __MODULE__)

  @impl true
  def init(_) do
    :timer.send_interval(@update_interval, :update_stream)

    {:ok,
     %{
       config: %{
         uart_pid: nil,
         ina219: AuxFuncs.initialize_ina219()
       },
       ecu_data: %EcuData{
         map_kpa: 0,
         map_bar: 0,
         map_psi: 0,
         mat_celsius: 0,
         battery_voltage: 0,
         rpm: 0,
         coolant: 0,
         tps: 0,
         connected: false
       }
     }, {:continue, :connect}}
  end

  @impl true
  def handle_continue(:connect, state) do
    serial_port =
      cond do
        File.exists?(@bt_port) -> @bt_port
        File.exists?(@usb_port) -> @usb_port
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
      {:error, reason} ->
        Logger.error("Failed to start UART: #{reason}")
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
    Logger.warning("UART not initialized, skipping tick.")
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

      {:error, reason} ->
        Logger.error("Erro ao ler dados: #{reason}")
        schedule_tick()
        {:noreply, state}
    end
  end

  def handle_info(
        :update_stream,
        %{config: %{ina219: ina219_state}} = state
      ) do
    if Process.whereis(DashElixirFlutter.StreamServer) do
      DashElixirFlutter.StreamServer.send_data(%StreamData{
        ecu_data: state.ecu_data,
        rpi_info: %RpiInfo{battery_perc: AuxFuncs.get_battery_data(ina219_state)}
      })
    end

    {:noreply, state}
  end

  defp schedule_reconnect() do
    Process.send_after(self(), :reconnect, @reconnect_interval)
  end

  defp schedule_tick() do
    Process.send_after(self(), :tick, @tick_interval)
  end
end
