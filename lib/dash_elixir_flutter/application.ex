defmodule DashElixirFlutter.Application do
  @moduledoc false
  require Logger
  alias NervesFlutterSupport.Udev

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {GRPC.Server.Supervisor, endpoint: DashElixirFlutter.RPC.Endpoint, port: 50051, start_server: true},
      {DashElixirFlutter.Serial, :ok}
    ] ++ children(Nerves.Runtime.mix_target())

    opts = [strategy: :one_for_one, name: DashElixirFlutter.Supervisor]

    :timer.apply_interval(:timer.seconds(5), __MODULE__, :log_time, [])

    Supervisor.start_link(children, opts)
  end

  def log_time() do
    Logger.info("Current monotonic time is: #{:erlang.monotonic_time()}")
  end

  # List all child processes to be supervised
  defp children(:host), do: []

  @dialyzer {:nowarn_function, children: 1}
  defp children(_target) do
    # Bit of a hack, but we need to wait for /dev/dri to exists...
    dri_card = get_output_card()

    launch_env = %{
      "FLUTTER_DRM_DEVICE" => "/dev/dri/#{dri_card}",
      "GALLIUM_HUD" => "cpu+fps",
      "GALLIUM_HUD_PERIOD" => "0.25",
      "GALLIUM_HUD_SCALE" => "3",
      "GALLIUM_HUD_VISIBLE" => "false",
      "GALLIUM_HUD_TOGGLE_SIGNAL" => "10"
    }

    [
      NervesFlutterSupport.Flutter.Engine.create_child(
        app_name: :dash_elixir_flutter,
        env: launch_env
      )
    ]
  end

  @dialyzer {:nowarn_function, get_output_card: 0}
  defp get_output_card() do
    Process.sleep(100)
    output = Udev.get_cards() |> Enum.find(fn card -> Udev.is_output_card?(card) end)

    if is_nil(output) do
      get_output_card()
    else
      output
    end
  end
end
