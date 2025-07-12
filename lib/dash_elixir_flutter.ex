defmodule DashElixirFlutter do
  alias DashElixirFlutter.AuxValues

  require Logger

  def seeds() do
    try do
      AuxValues.get_by_key!("distanceHodometer")
      Logger.info("Seeds already created")
    rescue
      _ ->
        dir = :code.priv_dir(:dash_elixir_flutter)
        Code.eval_file(Path.join([dir, "repo/seeds.exs"]))
        Logger.info("Seeds created")
    end

    :ok
  end
end
