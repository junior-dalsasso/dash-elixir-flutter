defmodule DashElixirFlutter.StreamDataBuilder do
  use GenServer

  alias DashElixirFlutter.StreamData
  alias DashElixirFlutter.EcuData
  alias DashElixirFlutter.ConsumptionData
  alias DashElixirFlutter.StreamServer

  def start_link(_opts), do: GenServer.start_link(__MODULE__, %{}, name: __MODULE__)

  def update_fields(map) when is_map(map), do: GenServer.cast(__MODULE__, {:update_fields, map})

  @impl true
  def init(_), do: {:ok, %{ecu_data: %EcuData{}, consumption_data: %ConsumptionData{}}}

  @impl true
  def handle_cast({:update_fields, updates}, state) do
    new_state = Map.merge(state, updates)
    send_to_stream(new_state)
    {:noreply, new_state}
  end

  defp send_to_stream(state) do
    if Process.whereis(StreamServer) do
      StreamServer.send_data(%StreamData{
        ecu_data: state.ecu_data,
        consumption_data: state.consumption_data
      })
    end
  end
end
