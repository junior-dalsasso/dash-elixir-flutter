import Config

Application.start(:nerves_bootstrap)

config :nerves, :firmware, rootfs_overlay: "rootfs_overlay"
config :nerves, source_date_epoch: "1727042167"
config :nerves_time_zones, default_time_zone: "America/Sao_Paulo"

if Mix.target() == :host do
  import_config "host.exs"
else
  import_config "target.exs"
end
