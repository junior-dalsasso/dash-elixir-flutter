defmodule DashElixirFlutter.Repo do
  use Ecto.Repo,
    otp_app: :dash_elixir_flutter,
    adapter: Ecto.Adapters.SQLite3
end
