defmodule DashElixirFlutter.StreamServer do
  use GenServer
  alias GRPC.Server

  def start_link(opts), do: GenServer.start_link(__MODULE__, opts, name: __MODULE__)

  def send_data(data) do
    GenServer.cast(__MODULE__, {:data, data})
  end

  @impl true
  def init(opts) do
    stream = Keyword.get(opts, :stream)
    {:ok, %{stream: stream}}
  end

  @impl true
  def handle_cast({:data, data}, state) do
    # Envia os dados para o cliente gRPC
    Server.send_reply(state.stream, data)
    {:noreply, state}
  end
end
