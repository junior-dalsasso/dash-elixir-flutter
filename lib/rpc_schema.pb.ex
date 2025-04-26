defmodule DashElixirFlutter.Empty do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule DashElixirFlutter.EcuData do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :map_kpa, 1, type: :float, json_name: "mapKpa"
  field :map_bar, 2, type: :float, json_name: "mapBar"
  field :map_psi, 3, type: :float, json_name: "mapPsi"
  field :mat_celsius, 4, type: :float, json_name: "matCelsius"
  field :battery_voltage, 5, type: :float, json_name: "batteryVoltage"
  field :rpm, 6, type: :float
  field :coolant, 7, type: :float
  field :tps, 8, type: :float
  field :connected, 9, type: :bool
end

defmodule DashElixirFlutter.RpiInfo do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :battery_perc, 1, type: :float, json_name: "batteryPerc"
end

defmodule DashElixirFlutter.StreamData do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ecu_data, 1, type: DashElixirFlutter.EcuData, json_name: "ecuData"
  field :rpi_info, 2, type: DashElixirFlutter.RpiInfo, json_name: "rpiInfo"
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
