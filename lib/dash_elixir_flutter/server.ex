defmodule DashElixirFlutter.RPC.Endpoint do
  use GRPC.Endpoint

  intercept(GRPC.Server.Interceptors.Logger)
  run(DashElixirFlutter.RPC.Server)
end

defmodule DashElixirFlutter.RPC.Server do
  use GRPC.Server, service: DashElixirFlutter.RPC.Service, http_transcode: true

  @spec stream_info(DashElixirFlutter.Empty.t(), GRPC.Server.Stream.t()) :: :ok
  def stream_info(_request, stream) do
    # Inicia o StreamServer com a stream gRPC
    {:ok, _pid} = DashElixirFlutter.StreamServer.start_link(stream: stream)

    # Mantém o processo vivo para continuar enviando dados
    Task.async(fn -> Process.sleep(:infinity) end) |> Task.await(:infinity)
  end

  @spec reboot_system(DashElixirFlutter.Empty.t(), GRPC.Server.Stream.t()) :: no_return
  def reboot_system(_request, _stream) do
    Nerves.Runtime.reboot()
  end
end
