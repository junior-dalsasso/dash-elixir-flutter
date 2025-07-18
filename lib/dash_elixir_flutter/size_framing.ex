defmodule DashElixirFlutter.SizeFraming do
  @behaviour Circuits.UART.Framing

  defmodule State do
    defstruct in_process: <<>>, frames: []
  end

  def init(_args), do: {:ok, %State{}}

  def add_framing(data, state) do
    size = byte_size(data)
    crc = :erlang.crc32(data)
    framed_data = <<size::16, data::binary, crc::32>>

    {:ok, framed_data, state}
  end

  def remove_framing(data, state) do
    {new_in_process, frames} = process_data(state.in_process <> data, state.frames)

    new_state = %State{state | in_process: new_in_process, frames: frames}
    {:ok, frames, new_state}
  end

  def frame_timeout(state) do
    partial_frame = {:partial, state.in_process}
    {:ok, [partial_frame], %State{state | in_process: <<>>}}
  end

  def flush(direction, state) when direction in [:receive, :both] do
    %State{state | in_process: <<>>, frames: []}
  end

  def flush(:transmit, state), do: state

  defp process_data(<<>>, frames), do: {<<>>, frames}

  defp process_data(<<size::16, data::binary-size(size), crc::32>>, frames) do
    if (:erlang.crc32(data) == crc) do
      process_data(<<>>, frames ++ [data])  # Mensagem recebida com sucesso
    else
      process_data(<<>>, frames)            # CRC inválido! Descartando pacote.
    end
  end

  defp process_data(<<size::16, rest::binary>>, frames), do: {<<size::16, rest::binary>>, frames}

  defp process_data(data, frames), do: {data, frames}
end
