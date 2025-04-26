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

  @update_interval 500
  @first_connect_delay 1_000

  @send_tick_delay 1000
  @send_try_connect_delay 1000
  @send_verify_connection_delay 5000

  def start_link(opts \\ []), do: GenServer.start_link(__MODULE__, opts, name: __MODULE__)

  @impl true
  def init(_) do
    {:ok, uart_pid} = Circuits.UART.start_link()

    Circuits.UART.configure(uart_pid,
      framing: {DashElixirFlutter.SizeFraming, max_length: 32000},
      active: true
    )

    ina219_state = AuxFuncs.initialize_ina219()
    AuxFuncs.bind_rfcomm()

    Process.send_after(self(), :try_connect, @first_connect_delay)
    :timer.send_interval(@update_interval, :update_stream)

    {:ok,
     %{
       config: %{
         uart_pid: uart_pid,
         ina219: ina219_state,
         ref_timer: nil,
         request_state: nil
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
     }}
  end

  @impl true
  def handle_info(:try_connect, %{config: %{uart_pid: uart_pid}} = state) do
    serial_port =
      cond do
        File.exists?(@bt_port) -> @bt_port
        File.exists?(@usb_port) -> @usb_port
        true -> nil
      end

    case Circuits.UART.open(uart_pid, serial_port, speed: 115_200, active: true) do
      :ok ->
        Logger.info("Conexão realizada com sucesso! 🚀")
        Process.send_after(self(), :tick, @send_tick_delay)

      {:error, _reason} ->
        Logger.error("Erro ao realizar conexão! 🙁")
        Process.send_after(self(), :try_connect, @send_try_connect_delay)
    end

    {:noreply, state}
  end

  def handle_info(:tick, state) do
    # Limpar o buffer antes de cada envio
    Circuits.UART.flush(state.config.uart_pid, :both)
    # Comando 'A' para solicitar dados em tempo real
    Circuits.UART.write(state.config.uart_pid, <<?A>>)
    Process.send_after(self(), :verify_connection, @send_verify_connection_delay)

    {:noreply, %{state | config: %{state.config | request_state: :sent}}}
  end

  def handle_info(:verify_connection, state) do
    case state.config.request_state do
      :sent ->
        Logger.error("Conexão deu timeout! 🙁")

        Circuits.UART.flush(state.config.uart_pid, :both)
        Circuits.UART.close(state.config.uart_pid)
        Process.send_after(self(), :try_connect, @send_try_connect_delay)

        {:noreply,
         %{
           state
           | config: %{state.config | request_state: :timed_out},
             ecu_data: %{state.ecu_data | connected: false}
         }}

      _ ->
        {:noreply, state}
    end
  end

  def handle_info({:circuits_uart, _port, data}, state) do
    case SerialParser.parse_data(data) do
      {:ok, parsed_data} ->
        Logger.info("Dados processados com sucesso! 🚀")
        Process.send_after(self(), :tick, @send_tick_delay)

        {:noreply,
         %{
           state
           | ecu_data: Map.merge(state.ecu_data, parsed_data),
             config: %{state.config | request_state: :received}
         }}

      :error ->
        case state.config.request_state do
          :sent ->
            Logger.error("Erro ao processar dados! 🙁")
            Process.send_after(self(), :tick, @send_tick_delay)

            {:noreply,
             %{
               state
               | config: %{state.config | request_state: :received}
             }}

          _ ->
            {:noreply, state}
        end
    end
  end

  def handle_info(
        :update_stream,
        %{config: %{ina219: ina219_state}} = state
      ) do
    if Process.whereis(DashElixirFlutter.StreamServer) do
      DashElixirFlutter.StreamServer.send_data(
         %StreamData{
           ecu_data: state.ecu_data,
           rpi_info: %RpiInfo{battery_perc: AuxFuncs.get_battery_data(ina219_state)}
         }
      )
    end

    {:noreply, state}
  end
end
