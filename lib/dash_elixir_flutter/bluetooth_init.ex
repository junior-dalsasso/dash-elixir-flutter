defmodule DashElixirFlutter.BluetoothInit do
  use GenServer

  require Logger

  @bluetooth_storage "/data/bluetooth"
  @last_connected_file Path.join(@bluetooth_storage, "last_connected")

  def start_link(opts \\ []),
    do: GenServer.start_link(__MODULE__, opts, name: __MODULE__, timeout: :infinity)

  @impl true
  def init(_) do
    if Nerves.Runtime.mix_target() != :host do
      System.cmd("mount", ["-t", "tmpfs", "-o", "size=1M", "tmpfs", "/var"])
      System.cmd("mkdir", ["-p", "/var/lib/bluetooth"])

      File.rm_rf("/run/messagebus.pid")
      File.mkdir_p!("/run/dbus")

      Port.open({:spawn_executable, "/usr/bin/dbus-daemon"}, [
        :binary,
        :exit_status,
        :stderr_to_stdout,
        args: ["--system", "--nofork"]
      ])

      System.cmd("hciattach", ["/dev/ttyAMA1", "bcm43xx", "921600", "noflow"])
      System.cmd("hciattach", ["/dev/ttyAMA1", "bcm43xx", "921600", "noflow"])
      System.cmd("hciconfig", ["hci0", "up"])

      Port.open({:spawn_executable, "/usr/libexec/bluetooth/bluetoothd"}, [
        :binary,
        :exit_status,
        :stderr_to_stdout,
        args: ["--compat", "-n", "-d"]
      ])

      System.cmd("bluetoothctl", ["power", "on"])

      address = get_last_connected_device()

      if address do
        try_connect_device(address)
      end

      Logger.warning("BT ligado com sucesso! 🚀")
    end

    :ignore
  end

  def try_connect_device(address) do
    File.mkdir_p!(@bluetooth_storage)

    System.cmd("rfcomm", ["release", "0"])

    case System.cmd("rfcomm", ["bind", "0", address]) do
      {_, 0} ->
        File.write!(@last_connected_file, address)
        :ok

      _ ->
        :error
    end
  end

  def get_last_connected_device() do
    if File.exists?(@last_connected_file) do
      File.read!(@last_connected_file)
    else
      nil
    end
  end

  def list_devices() do
    case System.cmd("hcitool", ["scan"]) do
      {output, 0} ->
        parse_scan_output(output)

      {error, _} ->
        IO.warn("Bluetooth scan failed: #{error}")
        []
    end
  end

  defp parse_scan_output(output) do
    lines = String.split(output, "\n")

    lines
    |> Enum.drop(1)
    |> Enum.drop(-1)
    |> Enum.map(&String.trim/1)
    |> Enum.map(&parse_device_line/1)
    |> Enum.filter(& &1)
  end

  defp parse_device_line(line) do
    case String.split(line, ["\t"], trim: true) do
      [address, name] -> %{address: address, name: name}
      _ -> nil
    end
  end
end
