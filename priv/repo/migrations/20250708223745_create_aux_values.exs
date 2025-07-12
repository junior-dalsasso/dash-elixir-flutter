defmodule DashElixirFlutter.Repo.Migrations.CreateAuxValues do
  use Ecto.Migration

  def change do
    create table :aux_values do
      add :key, :string, null: false
      add :value, :decimal, null: false, default: 0

      timestamps()
    end
  end
end
