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
         segundos_motor_ligado: 0.0,
         larg_pulso_bancada_1: 0.0,
         larg_pulso_bancada_2: 0.0,
         rpm: 0.0,
         avanco_ignicao: 0.0,
         status_motor: %StatusMotor{
           motor_pronto: false,
           motor_em_partida: false,
           enriquecimento_partida: false,
           ciclo_aquecimento: false
         },
         afr_alvo_bancada_1: 0.0,
         afr_alvo_bancada_2: 0.0,
         pressao_coletor: 0.0,
         temp_ar_coletor: 0.0,
         temp_agua: 0.0,
         tps: 0.0,
         tensao_bateria: 0.0,
         sonda_banco_1: 0.0,
         sonda_banco_2: 0.0,
         correcao_banco_1: 0.0,
         correcao_banco_2: 0.0,
         correcao_ar: 0.0,
         correcao_aquecimento: 0.0,
         correcao_rapida: 0.0,
         cutoff_tps: 0.0,
         correcao_combs_baro: 0.0,
         correcao_combs_total: 0.0,
         valor_ve_bancada_1: 0.0,
         valor_ve_bancada_2: 0.0,
         controle_marcha_lenta: 0.0,
         avanco_ignicao_frio: 0.0,
         tps_variacao: 0.0,
         map_variacao: 0.0,
         dwell: 0.0,
         carga_combustivel: 0.0,
         atualizacoes_amc: 0,
         kpaix_nao_usado: 0,
         leitura_tps_adc: 0.0,
         carga_combustivel_alg2: 0.0,
         carga_ignicao_alg1: 0.0,
         carga_ignicao_alg2: 0.0,
         contador_sincronismo: 0,
         erro_tempo_ignicao_pct: 0.0,
         tempo_entre_pulsos_us: 0,
         combustivel_parede_us: 0,
         entrada_analogica_0: 0.0,
         entrada_analogica_1: 0.0,
         entrada_analogica_2: 0.0,
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
