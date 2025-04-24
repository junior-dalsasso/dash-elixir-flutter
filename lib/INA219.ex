defmodule INA219 do
  import Bitwise
  require Logger

  # --- Registers ---
  @reg_config 0x00
  @reg_shunt_voltage 0x01
  @reg_bus_voltage 0x02
  @reg_power 0x03
  @reg_current 0x04
  @reg_calibration 0x05
  @config_bus_voltage_range_32v 0x2000
  @config_gain_8_320mv 0x1800
  @config_badc_res_12bit_32s 0x0680
  @config_sadc_res_12bit_32s 0x0068
  @config_mode_sandbvolt_continuous 0x0007

  @type state :: %__MODULE__{
          i2c_ref: Circuits.I2C.bus() | nil,
          addr: non_neg_integer(),
          cal_value: non_neg_integer(),
          current_lsb: float(),
          power_lsb: float()
        }

  defstruct i2c_ref: nil,
            addr: 0x40,
            cal_value: 0,
            current_lsb: 0.0,
            power_lsb: 0.0

  @spec open(bus_name :: String.t(), opts :: keyword()) :: {:ok, state()} | {:error, any()}
  def open(bus_name, opts \\ []) do
    addr = Keyword.get(opts, :addr, 0x40)
    config_preset = Keyword.get(opts, :config, :default)

    with {:ok, i2c_ref} <- Circuits.I2C.open(bus_name) do
      state = %__MODULE__{i2c_ref: i2c_ref, addr: addr}

      case config_preset do
        :default -> set_calibration_32v_2a(state)
        :cal_32v_2a -> set_calibration_32v_2a(state)
        _ -> {:error, :unknown_config_preset}
      end
    else
      error ->
        Logger.error("Failed to open I2C bus #{bus_name}: #{inspect(error)}")
        error
    end
  end

  @spec close(state :: state()) :: :ok | {:error, any()}
  def close(%__MODULE__{i2c_ref: i2c_ref}) do
    Circuits.I2C.close(i2c_ref)
  end

  def close(%__MODULE__{}) do
    :ok
  end

  @spec set_calibration_32v_2a(state :: state()) :: {:ok, state()} | {:error, any()}
  def set_calibration_32v_2a(state) do
    current_lsb = 0.0001
    cal_value = 4096
    power_lsb = 0.002
    state = %{state | cal_value: cal_value, current_lsb: current_lsb, power_lsb: power_lsb}

    with :ok <- write_register(state, @reg_calibration, cal_value) do
      config =
        @config_bus_voltage_range_32v |||
          @config_gain_8_320mv |||
          @config_badc_res_12bit_32s |||
          @config_sadc_res_12bit_32s |||
          @config_mode_sandbvolt_continuous

      case write_register(state, @reg_config, config) do
        :ok -> {:ok, state}
        error -> error
      end
    else
      error -> error
    end
  end

  @spec get_shunt_voltage_v(state :: state()) :: {:ok, {float(), state()}} | {:error, any()}
  def get_shunt_voltage_v(state) do
    with {:ok, raw_value} <- read_register_signed(state, @reg_shunt_voltage) do
      voltage = raw_value * 0.00001
      {:ok, {voltage, state}}
    else
      error -> error
    end
  end

  @spec get_bus_voltage_v(state :: state()) :: {:ok, {float(), state()}} | {:error, any()}
  def get_bus_voltage_v(state) do
    with {:ok, raw_value} <- read_register_unsigned(state, @reg_bus_voltage) do
      voltage = (raw_value >>> 3) * 0.004
      {:ok, {voltage, state}}
    else
      error -> error
    end
  end

  @spec get_current_a(state :: state()) :: {:ok, {float(), state()}} | {:error, any()}
  def get_current_a(state = %__MODULE__{}) when state.current_lsb == 0.0 do
    Logger.error("Cannot read current: Calibration not set (current_lsb is 0.0)")
    {:error, :calibration_not_set}
  end

  def get_current_a(state) do
    with :ok <- write_register(state, @reg_calibration, state.cal_value),
         {:ok, raw_value} <- read_register_signed(state, @reg_current) do
      current = raw_value * state.current_lsb
      {:ok, {current, state}}
    else
      error -> error
    end
  end

  @spec get_power_w(state :: state()) :: {:ok, {float(), state()}} | {:error, any()}
  def get_power_w(state = %__MODULE__{}) when state.power_lsb == 0.0 do
    Logger.error("Cannot read power: Calibration not set (power_lsb is 0.0)")
    {:error, :calibration_not_set}
  end

  def get_power_w(state) do
    with :ok <- write_register(state, @reg_calibration, state.cal_value),
         {:ok, raw_value} <- read_register_unsigned(state, @reg_power) do
      power = raw_value * state.power_lsb
      {:ok, {power, state}}
    else
      error -> error
    end
  end

  @spec get_battery_percentage(state :: state()) :: {:ok, {float(), state()}} | {:error, any()}
  def get_battery_percentage(state) do
    with {:ok, {bus_voltage, new_state}} <- get_bus_voltage_v(state) do
      percentage = (bus_voltage - 6.0) / 2.4 * 100.0
      clamped_percentage = max(0.0, min(percentage, 100.0))
      {:ok, {clamped_percentage, new_state}}
    else
      error -> error
    end
  end

  @spec write_register(state :: state(), reg :: byte(), value :: non_neg_integer()) :: :ok | {:error, any()}
  defp write_register(%__MODULE__{i2c_ref: i2c_ref, addr: addr}, reg, value) do
    payload = <<value::unsigned-big-integer-size(16)>>
    Circuits.I2C.write(i2c_ref, addr, <<reg::8, payload::binary>>)
  end

  defp write_register(%__MODULE__{i2c_ref: nil}, _reg, _value) do
    {:error, :i2c_not_open}
  end

  @spec read_register_unsigned(state :: state(), reg :: byte()) :: {:ok, non_neg_integer()} | {:error, any()}
  defp read_register_unsigned(%__MODULE__{i2c_ref: i2c_ref, addr: addr}, reg) do
    case Circuits.I2C.write_read(i2c_ref, addr, <<reg::8>>, 2) do
      {:ok, <<value::unsigned-big-integer-size(16)>>} ->
        {:ok, value}

      {:error, reason} ->
        Logger.error("I2C read error from reg #{inspect(reg)}: #{inspect(reason)}")
        {:error, reason}

      other ->
        Logger.error("Unexpected I2C read result from reg #{inspect(reg)}: #{inspect(other)}")
        {:error, {:unexpected_read_result, other}}
    end
  end

  defp read_register_unsigned(%__MODULE__{i2c_ref: nil}, _reg) do
    {:error, :i2c_not_open}
  end

  @spec read_register_signed(state :: state(), reg :: byte()) ::
          {:ok, integer()} | {:error, any()}
  defp read_register_signed(%__MODULE__{i2c_ref: i2c_ref, addr: addr}, reg) do
    case Circuits.I2C.write_read(i2c_ref, addr, <<reg::8>>, 2) do
      {:ok, <<value::signed-big-integer-size(16)>>} ->
        {:ok, value}

      {:error, reason} ->
        Logger.error("I2C read error from reg #{inspect(reg)}: #{inspect(reason)}")
        {:error, reason}

      other ->
        Logger.error("Unexpected I2C read result from reg #{inspect(reg)}: #{inspect(other)}")
        {:error, {:unexpected_read_result, other}}
    end
  end

  defp read_register_signed(%__MODULE__{i2c_ref: nil}, _reg) do
    {:error, :i2c_not_open}
  end
end
