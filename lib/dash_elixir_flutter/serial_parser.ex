defmodule DashElixirFlutter.SerialParser do
  import Bitwise
  @moduledoc """
  Módulo responsável por analisar e converter os dados brutos da porta serial.
  """

  @doc """
  Analisa os dados binários recebidos da ECU e converte para um mapa com valores legíveis.
  """
  def parse_data(<<
    _flag::8,                      #            Flag de identificação da request
    seconds::16,                   # 0:         Segundos desde que a ECU foi ligada
    pulseWidth1::16,               # 2:        Largura do pulso do injetor 1 (ms)
    pulseWidth2::16,               # 4:        Largura do pulso do injetor 2 (ms)
    rpm::16,                       # 6:        RPM do motor
    advance::16,                   # 8:        Avanço de ignição (graus BTDC)
    squirt::8,                     # 10:       Bitfield de quais injetores dispararam em determinado momento.
    engine::8,                     # 11:       Bitfield de status do motor
    afrtgt1::8,                    # 12:       AFR alvo do banco 1
    afrtgt2::8,                    # 13:       AFR alvo do banco 2
    wbo2_en1::8,                   # 14:       Não utilizado
    wbo2_en2::8,                   # 15:       Não utilizado
    barometer::16,                 # 16:       Pressão barométrica (kPa)
    map::16,                       # 18:       Pressão do coletor (MAP) (kPa)
    mat::16,                       # 20:       Temperatura do ar no coletor (MAT) (°F)
    coolant::16,                   # 22:       Temperatura do líquido de arrefecimento (°F)
    tps::16,                       # 24:       Posição do acelerador (TPS) (%)
    batteryVoltage::16,            # 26:       Tensão da bateria (V)
    afr1::16,                      # 28:       AFR1 (AFR)
    afr2::16,                      # 30:       AFR2 (AFR)
    knock::16,                     # 32:       Indicação de detonação (knock) (%)
    egoCorrection1::16,            # 34:       Correção EGO do banco 1 (%)
    egoCorrection2::16,            # 36:       Correção EGO do banco 2 (%)
    airCorrection::16,             # 38:       Correção de densidade do ar (%)
    warmupEnrich::16,              # 40:       Correção de aquecimento (%)
    accelEnrich::16,               # 42:       Enriquecimento por aceleração (%)
    tpsfuelcut::16,                # 44:       Corte de combustível por TPS (%)
    baroCorrection::16,            # 46:       Correção de combustível por pressão barométrica (%)
    gammaEnrich::16,               # 48:       Correção total de combustível (%)
    veCurr1::16,                   # 50:       Valor VE do banco 1 (%)
    veCurr2::16,                   # 52:       Valor VE do banco 2 (%)
    iacstep::16,                   # 54:       Passo do motor de passo ou valor PWM do controle de marcha lenta (%)
    coldAdvDeg::16,                # 56:       Avanço de ignição em frio (graus)
    tpsDot::16,                    # 58:       Taxa de variação do TPS (%/s)
    mapDot::16,                    # 60:       Taxa de variação do MAP (kPa/s)
    dwell::16,                     # 62:       Tempo de ignição (dwell) (ms)
    mafload::16,                   # 64:       Fluxo de massa de ar (MAF) (g/s)
    fuelload::16,                  # 66:       Carga de combustível (%)
    fuelCorrection::16,            # 68:       Correção de combustível (%)
    portStatus::8,                 # 70:       Spare port status bits
    knockRetard::8,                # 71:       Retardo de ignição por detonação (graus)
    eaeFuelCorr1::16,              # 72:       Correção de combustível por Flex (%)
    egoV::16,                      # 74:       Tensão do sensor O2 #1 (V)
    egoV2::16,                     # 76:       Tensão do sensor O2 #2 (V)
    status1::8,                    # 78:       status1
    status2::8,                    # 79:       status2
    status3::8,                    # 80:       status3
    status4::8,                    # 81:       status4
    looptime::16,                  # 82:       looptime (us)
    status5::16,                   # 84:       status5
    tpsADC::16,                    # 86:       Leitura bruta do TPS (ADC)
    fuelload2::16,                 # 88:       Carga de combustível (algoritmo 2)
    ignload::16,                   # 90:       Carga de ignição principal
    ignload2::16,                  # 92:       Carga de ignição secundária
    synccnt::8,                    # 94:       Contador de sincronismo do sensor
    timing_err::8,                 # 95:       Erro de tempo de ignição (%)
    deltaT::32,                    # 96:       Tempo entre pulsos de trigger (µs)
    wallfuel1::32,                 # 100:      Combustível acumulado nas paredes (µs)
    _gpioadc0::16,                 # 104      ""
    _gpioadc1::16,                 # 106      ""
    _gpioadc2::16,                 # 108      ""
    _gpioadc3::16,                 # 110      ""
    _gpioadc4::16,                 # 112      ""
    _gpioadc5::16,                 # 114      ""
    _gpioadc6::16,                 # 116      ""
    _gpioadc7::16,                 # 118      ""
    _gpiopwmin0::16,               # 120      ""
    _gpiopwmin1::16,               # 122      ""
    _gpiopwmin2::16,               # 124      ""
    _gpiopwmin3::16,               # 126      ""
    _adc6::16,                     # 128      ""
    _adc7::16,                     # 130      ""
    wallfuel2::32,                 # 132      "uS"
    eaeFuelCorr2::16,              # 136      "%"
    boostduty::8,                  # 138      "%"
    syncreason::8,                 # 139       ""
    user0::16,                     # 140       ""
    inj_adv1::16,                  # 142      "grau"
    inj_adv2::16,                  # 144      "grau"
    pulseWidth3::16,               # 146      "ms"
    pulseWidth4::16,               # 148      "ms"
    vetrim1curr::16,               # 150      "%"
    vetrim2curr::16,               # 152      "%"
    vetrim3curr::16,               # 154      "%"
    vetrim4curr::16,               # 156      "%"
    maf::16,                       # 158      "g/sec"
    eaeload1::16,                  # 160      ""
    afrload1::16,                  # 162      ""
    rpmDot::16,                    # 164      "rpm/sec"
    gpioport0::8,                  # 166      ""
    gpioport1::8,                  # 167      ""
    gpioport2::8,                  # 168      ""
    cl_idle_targ_rpm::16,          # 170      "rpm"
    maf_volts::16,                 # 172      "V"
    airtemp::16,                   # 174      "Celsius"
    dwell_trl::16,                 # 176      "ms"
    fuel_pct::16,                  # 178      "%"
    boost_targ::16,                # 180      "kPa"
    ext_advance::16,               # 182      "grau"
    base_advance::16,              # 184      "grau"
    idle_cor_advance::16,          # 186      "grau"
    mat_retard::16,                # 188      "grau"
    flex_advance::16,              # 190      "grau"
    adv1::16,                      # 192      "grau"
    adv2::16,                      # 194      "grau"
    adv3::16,                      # 196      "grau"
    revlim_retard::16,             # 198      "grau"
    nitrous_retard::16,            # 200      "grau"
    deadtime1::16,                 # 202      "s"
    n2o_addfuel::16,               # 204      "ms"
    portbde::8,                    # 206      ""
    portam::8,                     # 207      ""
    portt::8,                      # 208      ""
    can_error_cnt::8,              # 209      ""
    can_error::16,                 # 210      ""
    oil::16,                       # 212      "bar"
    fuel::16,                      # 214      "bar"
    runsecs::16,                   # 216      "s"
    start_retard::16,              # 218      "grau"
    _rest::binary
  >>) do
    {:ok, %{
      seconds: seconds,
      pulseWidth1: pulseWidth1 / 1000,
      pulseWidth2: pulseWidth2 / 1000,
      rpm: rpm,
      advance: advance / 10,
      squirt: squirt,
      engine: parse_status_motor(engine),
      afrtgt1: (afrtgt1 / 10) / 14.7,
      afrtgt2: (afrtgt2 / 10) / 14.7,
      wbo2_en1: wbo2_en1,
      wbo2_en2: wbo2_en2,
      barometer: Float.round(barometer / 1000, 2),
      map: Float.round(map / 1000, 2),
      mat: Float.round(fahrenheit_to_celsius(mat / 10), 2),
      coolant: Float.round(fahrenheit_to_celsius(coolant / 10), 2),
      tps: tps / 10,
      batteryVoltage: batteryVoltage / 10,
      afr1: (afr1 / 10) / 14.7,
      afr2: (afr2 / 10) / 14.7,
      knock: knock / 10,
      egoCorrection1: egoCorrection1 / 10,
      egoCorrection2: egoCorrection2 / 10,
      airCorrection: airCorrection / 10,
      warmupEnrich: warmupEnrich / 10,
      accelEnrich: accelEnrich / 10,
      tpsfuelcut: tpsfuelcut / 10,
      baroCorrection: baroCorrection / 10,
      gammaEnrich: gammaEnrich,
      veCurr1: veCurr1 / 10,
      veCurr2: veCurr2 / 10,
      iacstep: iacstep,
      coldAdvDeg: coldAdvDeg / 10,
      tpsDot: tpsDot / 10,
      mapDot: mapDot / 10,
      dwell: dwell,
      mafload: mafload / 10,
      fuelload: fuelload / 10,
      fuelCorrection: fuelCorrection,
      portStatus: portStatus,
      knockRetard: knockRetard * 0.1,
      eaeFuelCorr1: eaeFuelCorr1,
      egoV: egoV * 0.01,
      egoV2: egoV2 * 0.01,
      status1: status1,
      status2: status2,
      status3: status3,
      status4: status4,
      looptime: looptime,
      status5: status5,
      tpsADC: tpsADC,
      fuelload2: fuelload2,
      ignload: ignload,
      ignload2: ignload2,
      synccnt: synccnt,
      timing_err: timing_err * 0.1,
      deltaT: deltaT,
      wallfuel1: wallfuel1,
      # gpioadc0: gpioadc0,
      # gpioadc1: gpioadc1,
      # gpioadc2: gpioadc2,
      # gpioadc3: gpioadc3,
      # gpioadc4: gpioadc4,
      # gpioadc5: gpioadc5,
      # gpioadc6: gpioadc6,
      # gpioadc7: gpioadc7,
      # gpiopwmin0: gpiopwmin0,
      # gpiopwmin1: gpiopwmin1,
      # gpiopwmin2: gpiopwmin2,
      # gpiopwmin3: gpiopwmin3,
      # adc6: adc6,
      # adc7: adc7,
      wallfuel2: wallfuel2,
      eaeFuelCorr2: eaeFuelCorr2,
      boostduty: boostduty,
      syncreason: syncreason,
      user0: user0,
      inj_adv1: inj_adv1 * 0.100,
      inj_adv2: inj_adv2 * 0.100,
      pulseWidth3: pulseWidth3 * 0.000666,
      pulseWidth4: pulseWidth4 * 0.000666,
      vetrim1curr: vetrim1curr * 0.00976562500,
      vetrim2curr: vetrim2curr * 0.00976562500,
      vetrim3curr: vetrim3curr * 0.00976562500,
      vetrim4curr: vetrim4curr * 0.00976562500,
      maf: maf,
      eaeload1: eaeload1,
      afrload1: afrload1,
      rpmDot: rpmDot,
      gpioport0: gpioport0,
      gpioport1: gpioport1,
      gpioport2: gpioport2,
      cl_idle_targ_rpm: cl_idle_targ_rpm * 10,
      maf_volts: maf_volts * 0.001,
      airtemp: Float.round(fahrenheit_to_celsius(airtemp / 10), 2),
      dwell_trl: dwell_trl * 0.0666,
      fuel_pct: fuel_pct * 0.1000,
      boost_targ: boost_targ * 0.1,
      ext_advance: ext_advance * 0.100,
      base_advance: base_advance * 0.100,
      idle_cor_advance: idle_cor_advance * 0.100,
      mat_retard: mat_retard * 0.100,
      flex_advance: flex_advance * 0.100,
      adv1: adv1 * 0.100,
      adv2: adv2 * 0.100,
      adv3: adv3 * 0.100,
      revlim_retard: revlim_retard * 0.100,
      nitrous_retard: nitrous_retard * 0.100,
      deadtime1: deadtime1 * 0.001,
      n2o_addfuel: n2o_addfuel * 0.000666,
      portbde: portbde,
      portam: portam,
      portt: portt,
      can_error_cnt: can_error_cnt,
      can_error: can_error,
      oil: oil * 0.100,
      fuel: fuel * 0.100,
      runsecs: runsecs,
      start_retard: start_retard * 0.100,
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
