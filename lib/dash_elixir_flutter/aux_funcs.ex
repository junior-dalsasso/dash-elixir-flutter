defmodule DashElixirFlutter.AuxFuncs do
  def initialize_ina219 do
    if Nerves.Runtime.mix_target() != :host do
      case INA219.open("i2c-1", addr: 0x42) do
        {:ok, state} -> state
        {:error, _reason} -> nil
      end
    else
      nil
    end
  end

  def get_battery_data(nil), do: 0

  def get_battery_data(ina219) do
    if Nerves.Runtime.mix_target() != :host do
      case INA219.get_battery_percentage(ina219) do
        {:ok, {percentage, _new_state}} -> percentage
        {:error, reason} -> {:error, reason}
      end
    else
      50
    end
  end
end
