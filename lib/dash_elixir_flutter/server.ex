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

  @spec list_bluetooth_devices(DashElixirFlutter.Empty.t(), GRPC.Server.Stream.t()) :: DashElixirFlutter.DeviceList.t()
  def list_bluetooth_devices(_request, _stream) do
    devices = DashElixirFlutter.BluetoothInit.list_devices()
    %DashElixirFlutter.DeviceList{devices: devices}
  end

  @spec try_connect_device(DashElixirFlutter.Device.t(), GRPC.Server.Stream.t()) :: DashElixirFlutter.ActionResult.t()
  def try_connect_device(device, _stream) do
    DashElixirFlutter.BluetoothInit.try_connect_device(device.address)
    %DashElixirFlutter.ActionResult{result: true}
  end
end
