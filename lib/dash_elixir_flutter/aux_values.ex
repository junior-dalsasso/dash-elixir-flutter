defmodule DashElixirFlutter.AuxValues do
  import Ecto.Query, warn: false

  alias DashElixirFlutter.AuxValues.AuxValue
  alias DashElixirFlutter.Repo

  def get_by_key!(key) do
    Repo.get_by!(AuxValue, key: key)
  end

  def create_parameter(attrs \\ %{}) do
    %AuxValue{}
    |> AuxValue.changeset(attrs)
    |> Repo.insert!()
  end

  def update_parameter!(%AuxValue{} = param, attrs \\ %{}) do
    param
    |> AuxValue.changeset(attrs)
    |> Repo.update!()
  end

  def update_parameter_by_key!(String = param, attrs \\ %{}) do
    get_by_key!(param)
    |> AuxValue.changeset(attrs)
    |> Repo.update!()
  end

  def increase_distances!(value) do
    {:ok, _} =
      Repo.transaction(fn ->
        hodometer = get_by_key!("distanceHodometer")
        trip = get_by_key!("distanceTrip")
        update_parameter!(hodometer, %{value: Decimal.add(hodometer.value, value)})
        update_parameter!(trip, %{value: Decimal.add(trip.value, value)})
      end)

    :ok
  end

  def increase_consumptions!(value) do
    {:ok, _} =
      Repo.transaction(fn ->
        hodometer = get_by_key!("consumedHodometer")
        trip = get_by_key!("consumedTrip")
        update_parameter!(hodometer, %{value: Decimal.add(hodometer.value, value)})
        update_parameter!(trip, %{value: Decimal.add(trip.value, value)})
      end)

    :ok
  end

  def reset_hodometer!() do
    {:ok, _} =
      Repo.transaction(fn ->
        trip = get_by_key!("distanceHodometer")
        trip_consumed = get_by_key!("consumedHodometer")
        update_parameter!(trip, %{value: 0})
        update_parameter!(trip_consumed, %{value: 0})
      end)

    :ok
  end

  def reset_trip!() do
    {:ok, _} =
      Repo.transaction(fn ->
        trip = get_by_key!("distanceTrip")
        trip_consumed = get_by_key!("consumedTrip")
        update_parameter!(trip, %{value: 0})
        update_parameter!(trip_consumed, %{value: 0})
      end)

    :ok
  end
end
