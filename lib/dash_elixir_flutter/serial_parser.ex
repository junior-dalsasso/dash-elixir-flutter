defmodule DashElixirFlutter.SerialParser do
  @moduledoc """
  Módulo responsável por analisar e converter os dados brutos da porta serial.
  """

  @doc """
  Analisa os dados binários recebidos da ECU e converte para um mapa com valores legíveis.
  """
  def parse_data(data) do
    case data do
      <<
        _seconds::16,               # 0-1:      Segundos desde que a ECU foi ligada (não utilizado)
        _pulseWidth1::16,           # 2-3:      Largura do pulso do injetor 1 (ms) (não utilizado)
        _pulseWidth2::16,           # 4-5:      Largura do pulso do injetor 2 (ms) (não utilizado)
        rpm::16,                    # 6-7:      RPM do motor
        _advance::16,               # 8-9:      Avanço de ignição (graus BTDC) (não utilizado)
        _squirt::8,                 # 10:       Bitfield de eventos de injeção (não utilizado)
        _engine::8,                 # 11:       Bitfield de status do motor (não utilizado)
        _afrtgt1::8,                # 12:       AFR alvo do banco 1 (não utilizado)
        _afrtgt2::8,                # 13:       AFR alvo do banco 2 (não utilizado)
        _wbo2_en1::8,               # 14:       Não utilizado
        _wbo2_en2::8,               # 15:       Não utilizado
        _barometer::16,             # 16-17:    Pressão barométrica (kPa) (não utilizado)
        map::16,                    # 18-19:    Pressão do coletor (MAP) (kPa)
        mat::16,                    # 20-21:    Temperatura do ar no coletor (MAT) (°F)
        coolant::16,                # 22-23:    Temperatura do líquido de arrefecimento (°F)
        tps::16,                    # 24-25:    Posição do acelerador (TPS) (%) (não utilizado)
        batteryVoltage::16,         # 26-27:    Tensão da bateria (V)
        _afr1::16,                  # 28-29:    AFR1 (AFR) (não utilizado)
        _afr2::16,                  # 30-31:    AFR2 (AFR) (não utilizado)
        _knock::16,                 # 32-33:    Indicação de detonação (knock) (%) (não utilizado)
        _egocor1::16,               # 34-35:    Correção EGO do banco 1 (%) (não utilizado)
        _egocor2::16,               # 36-37:    Correção EGO do banco 2 (%) (não utilizado)
        _aircor::16,                # 38-39:    Correção de densidade do ar (%) (não utilizado)
        _warmcor::16,               # 40-41:    Correção de aquecimento (%) (não utilizado)
        _accelEnrich::16,           # 42-43:    Enriquecimento por aceleração (%) (não utilizado)
        _tpsfuelcut::16,            # 44-45:    Corte de combustível por TPS (%) (não utilizado)
        _baroCorrection::16,        # 46-47:    Correção de combustível por pressão barométrica (%) (não utilizado)
        _gammaEnrich::16,           # 48-49:    Correção total de combustível (%) (não utilizado)
        _ve1::16,                   # 50-51:    Valor VE do banco 1 (%) (não utilizado)
        _ve2::16,                   # 52-53:    Valor VE do banco 2 (%) (não utilizado)
        _iacstep::16,               # 54-55:    Passo do motor de passo ou valor PWM do controle de marcha lenta (%) (não utilizado)
        _cold_adv_deg::16,          # 56-57:    Avanço de ignição em frio (graus) (não utilizado)
        _TPSdot::16,                # 58-59:    Taxa de variação do TPS (%/s) (não utilizado)
        _MAPdot::16,                # 60-61:    Taxa de variação do MAP (kPa/s) (não utilizado)
        _dwell::16,                 # 62-63:    Tempo de ignição (dwell) (ms) (não utilizado)
        _MAF::16,                   # 64-65:    Fluxo de massa de ar (MAF) (g/s) (não utilizado)
        _fuelload::8,               # 66:       Carga de combustível (%) (não utilizado)
        _fuelcor::16,               # 68-69:    Correção de combustível por Flex (%) (não utilizado)
        _portStatus::8,             # 70:       Status das saídas digitais (não utilizado)
        _knockRetard::8,            # 71:       Retardo de ignição por detonação (graus) (não utilizado)
        _EAEfor1::16,               # 72-73:    Correção de combustível por X-Tau ou EAE 1 (%) (não utilizado)
        _egoV1::16,                 # 74-75:    Tensão do sensor O2 #1 (V) (não utilizado)
        _egoV2::16,                 # 76-77:    Tensão do sensor O2 #2 (V) (não utilizado)
        _amcUpdates::16,            # 78-79:    Não utilizado
        _kpaix::16,                 # 80-81:    Não utilizado
        _EAEfor2::16,               # 82-83:    Correção de combustível por X-Tau ou EAE 2 (%) (não utilizado)
        _spare1::16,                # 84-85:    Não utilizado
        _spare2::16,                # 86-87:    Não utilizado
        _trig_fix::16,              # 88-89:    Não utilizado
        _spare4::16,                # 90-91:    Não utilizado
        _spare5::16,                # 92-93:    Não utilizado
        _spare6::16,                # 94-95:    Não utilizado
        _spare7::16,                # 96-97:    Não utilizado
        _spare8::16,                # 98-99:    Não utilizado
        _spare9::16,                # 100-101:  Não utilizado
        _spare10::16,               # 102-103:  Não utilizado
        _rest::binary
      >> ->
        coolant_celsius = (coolant / 32) * 5 / 9
        mat_celsius = (mat / 32) * 5 / 9
        map_kpa = map / 10
        map_bar = map_kpa / 100
        map_psi = map_kpa * 0.1450377

        {:ok, %{
          map_kpa: Float.round(map_kpa, 2),
          map_bar: Float.round(map_bar, 2),
          map_psi: Float.round(map_psi, 2),
          mat_celsius: Float.round(mat_celsius, 2),
          battery_voltage: batteryVoltage / 10,
          rpm: rpm,
          coolant: Float.round(coolant_celsius, 2),
          tps: tps,
          connected: true
        }}

      _ -> :error
    end
  end
end
