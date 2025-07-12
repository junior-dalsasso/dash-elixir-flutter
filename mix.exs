defmodule DashElixirFlutter.MixProject do
  use Mix.Project

  @app :dash_elixir_flutter
  @version "0.1.0"

  # We currently support Raspberry Pi 4 and 5.
  # Other aarch64 platforms should also work, but require testing.
  @all_targets [:rpi4, :rpi4_bluez]

  def project do
    [
      app: @app,
      version: @version,
      elixir: "~> 1.17",
      archives: [nerves_bootstrap: "~> 1.13"],
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      releases: [{@app, release()}],
      preferred_cli_target: [run: :host, test: :host]
    ]
  end

  def application do
    [
      extra_applications: [:logger, :runtime_tools],
      mod: {DashElixirFlutter.Application, []}
    ]
  end

  defp deps do
    [
      {:nerves, "~> 1.10", runtime: false},
      {:shoehorn, "~> 0.9.1"},
      {:ring_logger, "~> 0.11.0"},
      {:toolshed, "~> 0.4.0"},
      {:nerves_runtime, "~> 0.13.0"},
      {:nerves_pack, "~> 0.7.1", targets: @all_targets},
      # {:nerves_system_rpi4, "~> 1.30.0", runtime: false, targets: :rpi4},
      {:nerves_system_rpi4_bluez, "~> 1.30.0", runtime: false, targets: :rpi4_bluez, path: "../nerves_system_rpi4", nerves: [compile: true]},
      {:nerves_flutter_support, "~> 1.0.0"},
      {:circuits_i2c, "~> 2.0"},
      {:muontrap, "~> 1.0"},
      {:circuits_gpio, "~> 2.1"},
      {:ecto_sql, "~> 3.0"},
      {:ecto_sqlite3, "~> 0.17"},

      # Serial Deps
      {:circuits_uart, "~> 1.5"},

      # Flutter Deps
      {:grpc, "~> 0.9"},
      {:protobuf_generate, "~> 0.1.1"},
      {:jason, "~> 1.4.0"}
    ]
  end

  def release do
    [
      overwrite: true,
      cookie: "#{@app}_cookie",
      include_erts: &Nerves.Release.erts/0,
      # NOTE: Notice the added `&NervesFlutterSupport.BuildFlutterApp.run/1` reference
      # This enabled the automatic compilation of a Flutter app located at `./flutter_app`, and release of it into the `./priv` directory.
      # This enables "zero-configuration" Flutter app embedding.
      steps: [
        &Nerves.Release.init/1,
        &NervesFlutterSupport.InstallRuntime.run/1,
        &NervesFlutterSupport.BuildFlutterApp.run/1,
        :assemble
      ],
      # You can configure the builder's input and output directories:
      # flutter: [
      #   project_dir: "/path/to/flutter_app/",
      #   output_dir: "/app/build/aot_output/path/",
      # ],
      strip_beams: Mix.env() == :prod or [keep: ["Docs"]]
    ]
  end
end
