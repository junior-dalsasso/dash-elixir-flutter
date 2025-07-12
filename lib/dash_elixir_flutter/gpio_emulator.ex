defmodule DashElixirFlutter.GpioEmulator do
  use GenServer

  require Logger

  def start_link(opts \\ []), do: GenServer.start_link(__MODULE__, opts)

  @impl true
  def init(opts) do
    if Nerves.Runtime.mix_target() != :host do
      :ignore
    else
      try do
        pin = Keyword.get(opts, :pin, 13)
        interval = Keyword.get(opts, :interval, 500)

        {:ok, gpio} = Circuits.GPIO.open(pin, :output)
        :timer.send_interval(interval, :toggle_action)

        Logger.warning("GPIO emulator started on pin #{pin}")
        {:ok, %{gpio: gpio, interval: interval}}
      rescue
        _ -> Logger.error("GPIO emulator not started")
      end
    end
  end

  @impl true
  def handle_info(:toggle_action, %{gpio: gpio, interval: interval} = state) do
    Circuits.GPIO.write(gpio, 1)
    :timer.sleep(interval)
    Circuits.GPIO.write(gpio, 0)

    {:noreply, state}
  end
end
