defmodule DashElixirFlutter.BluetoothInit do
  use GenServer

  require Logger

  @bluetooth_mac "98:D3:71:F6:E7:82"

  def start_link(opts \\ []),
    do: GenServer.start_link(__MODULE__, opts, name: __MODULE__, timeout: :infinity)

  @impl true
  def init(_) do
    if Nerves.Runtime.mix_target() != :host do
      # System.cmd("modprobe", ["bluetooth"])
      # System.cmd("modprobe", ["hci_uart"])
      File.rm_rf("/run/messagebus.pid")
      File.mkdir_p!("/run/dbus")

      # Process.sleep(3000)

      Port.open({:spawn_executable, "/usr/bin/dbus-daemon"}, [
        :binary,
        :exit_status,
        :stderr_to_stdout,
        args: ["--system", "--nofork"]
      ])

      # Process.sleep(3000)
      System.cmd("hciattach", ["/dev/ttyAMA1", "bcm43xx", "921600", "noflow"])
      # Process.sleep(3000)
      System.cmd("hciattach", ["/dev/ttyAMA1", "bcm43xx", "921600", "noflow"])
      # Process.sleep(3000)
      System.cmd("hciconfig", ["hci0", "up"])
      # Process.sleep(3000)

      Port.open({:spawn_executable, "/usr/libexec/bluetooth/bluetoothd"}, [
        :binary,
        :exit_status,
        :stderr_to_stdout,
        args: ["--compat", "-n", "-d"]
      ])

      # Process.sleep(3000)

      System.cmd("bluetoothctl", ["power", "on"])

      System.cmd("rfcomm", ["release", "0"])
      System.cmd("rfcomm", ["bind", "0", @bluetooth_mac])

      Logger.warning("BT ligado com sucesso! 🚀")
    end

    :ignore
  end
end
