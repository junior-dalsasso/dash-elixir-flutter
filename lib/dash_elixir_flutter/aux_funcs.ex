defmodule DashElixirFlutter.AuxFuncs do

  @bluetooth_mac "98:D3:71:F6:E7:82"

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

  def bind_rfcomm do
    if Nerves.Runtime.mix_target() != :host do
      System.cmd("rfcomm", ["release", "0"])
      System.cmd("rfcomm", ["bind", "0", @bluetooth_mac])
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
