import Config

Application.start(:nerves_bootstrap)

config :nerves, :firmware, rootfs_overlay: "rootfs_overlay"
config :nerves, source_date_epoch: "1727042167"
config :nerves_time_zones, default_time_zone: "America/Sao_Paulo"
config :dash_elixir_flutter, ecto_repos: [DashElixirFlutter.Repo]

config :dash_elixir_flutter,
       DashElixirFlutter.Repo,
       database: if(Mix.target() == :host, do: "dash.db", else: "/data/dash.db"),
       log: false

if Mix.target() == :host do
  import_config "host.exs"
else
  import_config "target.exs"
end
