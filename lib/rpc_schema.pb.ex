defmodule DashElixirFlutter.Empty do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule DashElixirFlutter.EcuData do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :segundos_motor_ligado, 1, type: :float, json_name: "segundosMotorLigado"
  field :larg_pulso_bancada_1, 2, type: :float, json_name: "largPulsoBancada1"
  field :larg_pulso_bancada_2, 3, type: :float, json_name: "largPulsoBancada2"
  field :rpm, 4, type: :float
  field :avanco_ignicao, 5, type: :float, json_name: "avancoIgnicao"
  field :status_motor, 6, type: DashElixirFlutter.StatusMotor, json_name: "statusMotor"
  field :afr_alvo_bancada_1, 7, type: :float, json_name: "afrAlvoBancada1"
  field :afr_alvo_bancada_2, 8, type: :float, json_name: "afrAlvoBancada2"
  field :pressao_coletor, 9, type: :float, json_name: "pressaoColetor"
  field :temp_ar_coletor, 10, type: :float, json_name: "tempArColetor"
  field :temp_agua, 11, type: :float, json_name: "tempAgua"
  field :tps, 12, type: :float
  field :tensao_bateria, 13, type: :float, json_name: "tensaoBateria"
  field :sonda_banco_1, 14, type: :float, json_name: "sondaBanco1"
  field :sonda_banco_2, 15, type: :float, json_name: "sondaBanco2"
  field :correcao_banco_1, 16, type: :float, json_name: "correcaoBanco1"
  field :correcao_banco_2, 17, type: :float, json_name: "correcaoBanco2"
  field :correcao_ar, 18, type: :float, json_name: "correcaoAr"
  field :correcao_aquecimento, 19, type: :float, json_name: "correcaoAquecimento"
  field :correcao_rapida, 20, type: :float, json_name: "correcaoRapida"
  field :cutoff_tps, 21, type: :float, json_name: "cutoffTps"
  field :correcao_combs_baro, 22, type: :float, json_name: "correcaoCombsBaro"
  field :correcao_combs_total, 23, type: :float, json_name: "correcaoCombsTotal"
  field :valor_ve_bancada_1, 24, type: :float, json_name: "valorVeBancada1"
  field :valor_ve_bancada_2, 25, type: :float, json_name: "valorVeBancada2"
  field :controle_marcha_lenta, 26, type: :float, json_name: "controleMarchaLenta"
  field :avanco_ignicao_frio, 27, type: :float, json_name: "avancoIgnicaoFrio"
  field :tps_variacao, 28, type: :float, json_name: "tpsVariacao"
  field :map_variacao, 29, type: :float, json_name: "mapVariacao"
  field :dwell, 30, type: :float
  field :carga_combustivel, 31, type: :float, json_name: "cargaCombustivel"
  field :atualizacoes_amc, 32, type: :uint32, json_name: "atualizacoesAmc"
  field :kpaix_nao_usado, 33, type: :uint32, json_name: "kpaixNaoUsado"
  field :leitura_tps_adc, 34, type: :float, json_name: "leituraTpsAdc"
  field :carga_combustivel_alg2, 35, type: :float, json_name: "cargaCombustivelAlg2"
  field :carga_ignicao_alg1, 36, type: :float, json_name: "cargaIgnicaoAlg1"
  field :carga_ignicao_alg2, 37, type: :float, json_name: "cargaIgnicaoAlg2"
  field :contador_sincronismo, 38, type: :uint32, json_name: "contadorSincronismo"
  field :erro_tempo_ignicao_pct, 39, type: :float, json_name: "erroTempoIgnicaoPct"
  field :tempo_entre_pulsos_us, 40, type: :uint32, json_name: "tempoEntrePulsosUs"
  field :combustivel_parede_us, 41, type: :uint32, json_name: "combustivelParedeUs"
  field :entrada_analogica_0, 42, type: :float, json_name: "entradaAnalogica0"
  field :entrada_analogica_1, 43, type: :float, json_name: "entradaAnalogica1"
  field :entrada_analogica_2, 44, type: :float, json_name: "entradaAnalogica2"
  field :connected, 45, type: :bool
end

defmodule DashElixirFlutter.StatusMotor do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :motor_parado, 1, type: :bool, json_name: "motorParado"
  field :motor_em_funcionamento, 2, type: :bool, json_name: "motorEmFuncionamento"
  field :sincronismo_ok, 3, type: :bool, json_name: "sincronismoOk"
  field :aquecendo, 4, type: :bool
  field :corte_combustivel_ativo, 5, type: :bool, json_name: "corteCombustivelAtivo"
  field :injetando_combustivel, 6, type: :bool, json_name: "injetandoCombustivel"
  field :ignicao_ativa, 7, type: :bool, json_name: "ignicaoAtiva"
  field :erro_detectado, 8, type: :bool, json_name: "erroDetectado"
end

defmodule DashElixirFlutter.StreamData do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ecu_data, 1, type: DashElixirFlutter.EcuData, json_name: "ecuData"
end

defmodule DashElixirFlutter.RPC.Service do
  @moduledoc false

  use GRPC.Service, name: "DashElixirFlutter.RPC", protoc_gen_elixir_version: "0.14.0"

  rpc(:StreamInfo, DashElixirFlutter.Empty, stream(DashElixirFlutter.StreamData), %{
    http: %{
      type: Google.Api.PbExtension,
      value: %Google.Api.HttpRule{
        selector: "",
        body: "",
        additional_bindings: [],
        response_body: "",
        pattern: {:get, "/streamInfo"},
        __unknown_fields__: []
      }
    }
  })

  rpc(:RebootSystem, DashElixirFlutter.Empty, DashElixirFlutter.Empty, %{
    http: %{
      type: Google.Api.PbExtension,
      value: %Google.Api.HttpRule{
        selector: "",
        body: "",
        additional_bindings: [],
        response_body: "",
        pattern: {:get, "/rebootSystem"},
        __unknown_fields__: []
      }
    }
  })
end

defmodule DashElixirFlutter.RPC.Stub do
  @moduledoc false

  use GRPC.Stub, service: DashElixirFlutter.RPC.Service
end
