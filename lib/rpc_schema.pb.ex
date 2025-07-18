defmodule DashElixirFlutter.Empty do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3
end

defmodule DashElixirFlutter.EcuData do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :seconds, 1, type: :float
  field :pulseWidth1, 2, type: :float
  field :pulseWidth2, 3, type: :float
  field :rpm, 4, type: :float
  field :advance, 5, type: :float
  field :squirt, 6, type: :float
  field :engine, 7, type: DashElixirFlutter.StatusMotor
  field :afrtgt1, 8, type: :float
  field :afrtgt2, 9, type: :float
  field :wbo2_en1, 10, type: :float, json_name: "wbo2En1"
  field :wbo2_en2, 11, type: :float, json_name: "wbo2En2"
  field :barometer, 12, type: :float
  field :map, 13, type: :float
  field :mat, 14, type: :float
  field :coolant, 15, type: :float
  field :tps, 16, type: :float
  field :batteryVoltage, 17, type: :float
  field :afr1, 18, type: :float
  field :afr2, 19, type: :float
  field :knock, 20, type: :float
  field :egoCorrection1, 21, type: :float
  field :egoCorrection2, 22, type: :float
  field :airCorrection, 23, type: :float
  field :warmupEnrich, 24, type: :float
  field :accelEnrich, 25, type: :float
  field :tpsfuelcut, 26, type: :float
  field :baroCorrection, 27, type: :float
  field :gammaEnrich, 28, type: :float
  field :veCurr1, 29, type: :float
  field :veCurr2, 30, type: :float
  field :iacstep, 31, type: :float
  field :coldAdvDeg, 32, type: :float
  field :tpsDot, 33, type: :float
  field :mapDot, 34, type: :float
  field :dwell, 35, type: :float
  field :mafload, 36, type: :float
  field :fuelload, 37, type: :float
  field :fuelCorrection, 38, type: :float
  field :portStatus, 39, type: :float
  field :knockRetard, 40, type: :float
  field :eaeFuelCorr1, 41, type: :float
  field :egoV, 42, type: :float
  field :egoV2, 43, type: :float
  field :status1, 44, type: :float
  field :status2, 45, type: :float
  field :status3, 46, type: :float
  field :status4, 47, type: :float
  field :looptime, 48, type: :float
  field :status5, 49, type: :float
  field :tpsADC, 50, type: :float
  field :fuelload2, 51, type: :float
  field :ignload, 52, type: :float
  field :ignload2, 53, type: :float
  field :synccnt, 54, type: :float
  field :timing_err, 55, type: :float, json_name: "timingErr"
  field :deltaT, 56, type: :float
  field :wallfuel1, 57, type: :float
  field :wallfuel2, 58, type: :float
  field :eaeFuelCorr2, 59, type: :float
  field :boostduty, 60, type: :float
  field :syncreason, 61, type: :float
  field :user0, 62, type: :float
  field :inj_adv1, 63, type: :float, json_name: "injAdv1"
  field :inj_adv2, 64, type: :float, json_name: "injAdv2"
  field :pulseWidth3, 65, type: :float
  field :pulseWidth4, 66, type: :float
  field :vetrim1curr, 67, type: :float
  field :vetrim2curr, 68, type: :float
  field :vetrim3curr, 69, type: :float
  field :vetrim4curr, 70, type: :float
  field :maf, 71, type: :float
  field :eaeload1, 72, type: :float
  field :afrload1, 73, type: :float
  field :rpmDot, 74, type: :float
  field :gpioport0, 75, type: :float
  field :gpioport1, 76, type: :float
  field :gpioport2, 77, type: :float
  field :cl_idle_targ_rpm, 78, type: :float, json_name: "clIdleTargRpm"
  field :maf_volts, 79, type: :float, json_name: "mafVolts"
  field :airtemp, 80, type: :float
  field :dwell_trl, 81, type: :float, json_name: "dwellTrl"
  field :fuel_pct, 82, type: :float, json_name: "fuelPct"
  field :boost_targ, 83, type: :float, json_name: "boostTarg"
  field :ext_advance, 84, type: :float, json_name: "extAdvance"
  field :base_advance, 85, type: :float, json_name: "baseAdvance"
  field :idle_cor_advance, 86, type: :float, json_name: "idleCorAdvance"
  field :mat_retard, 87, type: :float, json_name: "matRetard"
  field :flex_advance, 88, type: :float, json_name: "flexAdvance"
  field :adv1, 89, type: :float
  field :adv2, 90, type: :float
  field :adv3, 91, type: :float
  field :revlim_retard, 92, type: :float, json_name: "revlimRetard"
  field :nitrous_retard, 93, type: :float, json_name: "nitrousRetard"
  field :deadtime1, 94, type: :float
  field :n2o_addfuel, 95, type: :float, json_name: "n2oAddfuel"
  field :portbde, 96, type: :float
  field :portam, 97, type: :float
  field :portt, 98, type: :float
  field :can_error_cnt, 99, type: :float, json_name: "canErrorCnt"
  field :can_error, 100, type: :float, json_name: "canError"
  field :oil, 101, type: :float
  field :fuel, 102, type: :float
  field :runsecs, 103, type: :float
  field :start_retard, 104, type: :float, json_name: "startRetard"
  field :connected, 105, type: :bool
end

defmodule DashElixirFlutter.StatusMotor do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :motor_pronto, 1, type: :bool, json_name: "motorPronto"
  field :motor_em_partida, 2, type: :bool, json_name: "motorEmPartida"
  field :enriquecimento_partida, 3, type: :bool, json_name: "enriquecimentoPartida"
  field :ciclo_aquecimento, 4, type: :bool, json_name: "cicloAquecimento"
end

defmodule DashElixirFlutter.ConsumptionData do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :hodometer, 1, type: :float
  field :trip, 2, type: :float
  field :hodometer_consumed, 3, type: :float, json_name: "hodometerConsumed"
  field :trip_consumed, 4, type: :float, json_name: "tripConsumed"
  field :hodometer_fuel_by_distance, 5, type: :float, json_name: "hodometerFuelByDistance"
  field :trip_fuel_by_distance, 6, type: :float, json_name: "tripFuelByDistance"
  field :current_speed, 7, type: :float, json_name: "currentSpeed"
end

defmodule DashElixirFlutter.StreamData do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ecu_data, 1, type: DashElixirFlutter.EcuData, json_name: "ecuData"

  field :consumption_data, 2,
    type: DashElixirFlutter.ConsumptionData,
    json_name: "consumptionData"
end

defmodule DashElixirFlutter.Device do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :name, 1, type: :string
  field :address, 2, type: :string
end

defmodule DashElixirFlutter.DeviceList do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :devices, 1, repeated: true, type: DashElixirFlutter.Device
end

defmodule DashElixirFlutter.ActionResult do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :result, 1, type: :bool
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

  rpc(:startCalibration, DashElixirFlutter.Empty, DashElixirFlutter.Empty, %{
    http: %{
      type: Google.Api.PbExtension,
      value: %Google.Api.HttpRule{
        selector: "",
        body: "",
        additional_bindings: [],
        response_body: "",
        pattern: {:get, "/startCalibration"},
        __unknown_fields__: []
      }
    }
  })

  rpc(:resetTrip, DashElixirFlutter.Empty, DashElixirFlutter.Empty, %{
    http: %{
      type: Google.Api.PbExtension,
      value: %Google.Api.HttpRule{
        selector: "",
        body: "",
        additional_bindings: [],
        response_body: "",
        pattern: {:get, "/resetTrip"},
        __unknown_fields__: []
      }
    }
  })

  rpc(:resetHodometer, DashElixirFlutter.Empty, DashElixirFlutter.Empty, %{
    http: %{
      type: Google.Api.PbExtension,
      value: %Google.Api.HttpRule{
        selector: "",
        body: "",
        additional_bindings: [],
        response_body: "",
        pattern: {:get, "/resetHodometer"},
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

  rpc(:listBluetoothDevices, DashElixirFlutter.Empty, DashElixirFlutter.DeviceList, %{
    http: %{
      type: Google.Api.PbExtension,
      value: %Google.Api.HttpRule{
        selector: "",
        body: "",
        additional_bindings: [],
        response_body: "",
        pattern: {:get, "/listBluetoothDevices"},
        __unknown_fields__: []
      }
    }
  })

  rpc(:tryConnectDevice, DashElixirFlutter.Device, DashElixirFlutter.ActionResult, %{
    http: %{
      type: Google.Api.PbExtension,
      value: %Google.Api.HttpRule{
        selector: "",
        body: "",
        additional_bindings: [],
        response_body: "",
        pattern: {:get, "/tryConnectDevice"},
        __unknown_fields__: []
      }
    }
  })
end

defmodule DashElixirFlutter.RPC.Stub do
  @moduledoc false

  use GRPC.Stub, service: DashElixirFlutter.RPC.Service
end
