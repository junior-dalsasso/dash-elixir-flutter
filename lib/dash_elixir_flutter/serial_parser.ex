defmodule DashElixirFlutter.SerialParser do
  import Bitwise
  @moduledoc """
  Módulo responsável por analisar e converter os dados brutos da porta serial.
  """

  @doc """
  Analisa os dados binários recebidos da ECU e converte para um mapa com valores legíveis.
  """
  def parse_data(<<
    segundos_motor_ligado::16,  # 0-1:      Segundos desde que a ECU foi ligada
    larg_pulso_bancada_1::16,   # 2-3:      Largura do pulso do injetor 1 (ms)
    larg_pulso_bancada_2::16,   # 4-5:      Largura do pulso do injetor 2 (ms)
    rpm::16,                    # 6-7:      RPM do motor
    avanco_ignicao::16,         # 8-9:      Avanço de ignição (graus BTDC)
    _status_bicos::8,            # 10:       Bitfield de quais injetores dispararam em determinado momento.
    status_motor::8,            # 11:       Bitfield de status do motor
    afr_alvo_bancada_1::8,      # 12:       AFR alvo do banco 1
    afr_alvo_bancada_2::8,      # 13:       AFR alvo do banco 2
    _wbo2_en1::8,               # 14:       Não utilizado
    _wbo2_en2::8,               # 15:       Não utilizado
    _pressao_atmosferica::16,    # 16-17:    Pressão barométrica (kPa)
    pressao_coletor::16,        # 18-19:    Pressão do coletor (MAP) (kPa)
    temp_ar_coletor::16,        # 20-21:    Temperatura do ar no coletor (MAT) (°F)
    temp_agua::16,              # 22-23:    Temperatura do líquido de arrefecimento (°F)
    tps::16,                    # 24-25:    Posição do acelerador (TPS) (%)
    tensao_bateria::16,         # 26-27:    Tensão da bateria (V)
    sonda_banco_1::16,          # 28-29:    AFR1 (AFR)
    sonda_banco_2::16,          # 30-31:    AFR2 (AFR)
    _sensor_detonacao::16,       # 32-33:    Indicação de detonação (knock) (%)
    correcao_banco_1::16,       # 34-35:    Correção EGO do banco 1 (%)
    correcao_banco_2::16,       # 36-37:    Correção EGO do banco 2 (%)
    correcao_ar::16,            # 38-39:    Correção de densidade do ar (%)
    correcao_aquecimento::16,   # 40-41:    Correção de aquecimento (%)
    correcao_rapida::16,        # 42-43:    Enriquecimento por aceleração (%)
    cutoff_tps::16,             # 44-45:    Corte de combustível por TPS (%)
    correcao_combs_baro::16,    # 46-47:    Correção de combustível por pressão barométrica (%)
    correcao_combs_total::16,   # 48-49:    Correção total de combustível (%)
    valor_ve_bancada_1::16,     # 50-51:    Valor VE do banco 1 (%)
    valor_ve_bancada_2::16,     # 52-53:    Valor VE do banco 2 (%)
    controle_marcha_lenta::16,  # 54-55:    Passo do motor de passo ou valor PWM do controle de marcha lenta (%)
    avanco_ignicao_frio::16,    # 56-57:    Avanço de ignição em frio (graus)
    tps_variacao::16,           # 58-59:    Taxa de variação do TPS (%/s)
    map_variacao::16,           # 60-61:    Taxa de variação do MAP (kPa/s)
    dwell::16,                  # 62-63:    Tempo de ignição (dwell) (ms)
    _maf::16,                   # 64-65:    Fluxo de massa de ar (MAF) (g/s)
    carga_combustivel::8,       # 66:       Carga de combustível (%)
    _padding_67::8,             # 67:       Byte não utilizado
    _correcao_flex_pct::16,      # 68-69:   Correção de combustível por Flex (%)
    _status_saidas_digitais::8,  # 70:      Status das saídas digitais
    _retardo_ignicao_knock::8,   # 71:      Retardo de ignição por detonação (graus)
    _correcao_eae_banco1::16,    # 72-73:   Correção de combustível por EAE/X-Tau 1 (%)
    _tensao_o2_banco1::16,       # 74-75:   Tensão do sensor O2 #1 (V)
    _tensao_o2_banco2::16,       # 76-77:   Tensão do sensor O2 #2 (V)
    atualizacoes_amc::16,       # 78-79:    Reservado (não utilizado)
    kpaix_nao_usado::16,        # 80-81:    Reservado (não utilizado)
    _correcao_eae_banco2::16,    # 82-83:   Correção de combustível por EAE/X-Tau 2 (%)
    _status5_indefinido::16,     # 84-85:   Campo de status genérico
    leitura_tps_adc::16,        # 86-87:    Leitura bruta do TPS (ADC)
    carga_combustivel_alg2::16, # 88-89:    Carga de combustível (algoritmo 2)
    carga_ignicao_alg1::16,     # 90-91:    Carga de ignição principal
    carga_ignicao_alg2::16,     # 92-93:    Carga de ignição secundária
    contador_sincronismo::8,    # 94:       Contador de sincronismo do sensor
    erro_tempo_ignicao_pct::8,  # 95:       Erro de tempo de ignição (%)
    tempo_entre_pulsos_us::32,  # 96-99:    Tempo entre pulsos de trigger (µs)
    combustivel_parede_us::32,  # 100-103:  Combustível acumulado nas paredes (µs)
    entrada_analogica_0::16,    # 104-105:  Entrada analógica GPIO 0
    entrada_analogica_1::16,    # 106-107:  Entrada analógica GPIO 1
    entrada_analogica_2::16,    # 108-109:  Entrada analógica GPIO 2
    _rest::binary
  >>) do
    {:ok, %{
      segundos_motor_ligado: segundos_motor_ligado,
      larg_pulso_bancada_1: larg_pulso_bancada_1 / 1000,
      larg_pulso_bancada_2: larg_pulso_bancada_2 / 1000,
      rpm: rpm,
      avanco_ignicao: avanco_ignicao / 10,
      status_motor: parse_status_motor(status_motor),
      afr_alvo_bancada_1: afr_alvo_bancada_1 / 10,
      afr_alvo_bancada_2: afr_alvo_bancada_2 / 10,
      pressao_coletor: Float.round(pressao_coletor / 1000, 2),
      temp_ar_coletor: Float.round(fahrenheit_to_celsius(temp_ar_coletor / 10), 2),
      temp_agua: Float.round(fahrenheit_to_celsius(temp_agua / 10), 2),
      tps: tps / 10,
      tensao_bateria: tensao_bateria / 10,
      sonda_banco_1: sonda_banco_1 / 10,
      sonda_banco_2: sonda_banco_2 / 10,
      correcao_banco_1: correcao_banco_1 / 10,
      correcao_banco_2: correcao_banco_2 / 10,
      correcao_ar: correcao_ar / 10,
      correcao_aquecimento: correcao_aquecimento / 10,
      correcao_rapida: correcao_rapida / 10,
      cutoff_tps: cutoff_tps / 10,
      correcao_combs_baro: correcao_combs_baro / 10,
      correcao_combs_total: correcao_combs_total / 10,
      valor_ve_bancada_1: valor_ve_bancada_1 / 10,
      valor_ve_bancada_2: valor_ve_bancada_2 / 10,
      controle_marcha_lenta: controle_marcha_lenta,
      avanco_ignicao_frio: avanco_ignicao_frio / 10,
      tps_variacao: tps_variacao / 10,
      map_variacao: map_variacao / 10,
      dwell: dwell / 10,
      carga_combustivel: carga_combustivel / 10,
      atualizacoes_amc: atualizacoes_amc,
      kpaix_nao_usado: kpaix_nao_usado,
      leitura_tps_adc: leitura_tps_adc,
      carga_combustivel_alg2: carga_combustivel_alg2,
      carga_ignicao_alg1: carga_ignicao_alg1,
      carga_ignicao_alg2: carga_ignicao_alg2,
      contador_sincronismo: contador_sincronismo,
      erro_tempo_ignicao_pct: erro_tempo_ignicao_pct,
      tempo_entre_pulsos_us: tempo_entre_pulsos_us,
      combustivel_parede_us: combustivel_parede_us,
      entrada_analogica_0: entrada_analogica_0,
      entrada_analogica_1: entrada_analogica_1,
      entrada_analogica_2: entrada_analogica_2,
      connected: true
    }}
  end

  def parse_data(_data), do: {:error, :invalid_data}

  defp parse_status_motor(bits) do
    %{
      motor_pronto: (bits &&& 0b00000001) != 0,
      motor_em_partida: (bits &&& 0b00000010) != 0,
      enriquecimento_partida: (bits &&& 0b00000100) != 0,
      ciclo_aquecimento: (bits &&& 0b00001000) != 0
    }
  end

  defp fahrenheit_to_celsius(f), do: (f - 32.0) * (5.0 / 9.0)
end
