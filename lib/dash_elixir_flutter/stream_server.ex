defmodule DashElixirFlutter.StreamServer do
  use GenServer
  alias GRPC.Server

  def start_link(opts), do: GenServer.start_link(__MODULE__, opts, name: __MODULE__)

  @impl true
  def init(opts) do
    stream = Keyword.get(opts, :stream)
    {:ok, %{stream: stream}}
  end

  @impl true
  def handle_info({:ecu_data, data}, state) do
    ecu_data = %DashElixirFlutter.EcuData{
      map_kpa: data.map_kpa,
      map_bar: data.map_bar,
      map_psi: data.map_psi,
      mat_celsius: data.mat_celsius,
      battery_voltage: data.battery_voltage,
      rpm: data.rpm,
      coolant: data.coolant,
      tps: data.tps,
      rpi_battery_perc: data.rpi_battery_perc,
      connected: data.connected
    }

    # Envia os dados para o cliente gRPC
    Server.send_reply(state.stream, ecu_data)
    {:noreply, state}
  end
end
