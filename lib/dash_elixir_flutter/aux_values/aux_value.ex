defmodule DashElixirFlutter.AuxValues.AuxValue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "aux_values" do
    field(:key, :string)
    field(:value, :decimal)

    timestamps()
  end

  def changeset(consume_distance, attrs) do
    consume_distance
    |> cast(attrs, [:key, :value])
    |> validate_required([:key, :value])
  end
end
