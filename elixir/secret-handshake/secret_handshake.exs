defmodule SecretHandshake do
  use Bitwise
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    []
    |> process_operation(code, 0b1000,  &["jump" | &1])
    |> process_operation(code, 0b100,   &["close your eyes" | &1])
    |> process_operation(code, 0b10,    &["double blink" | &1])
    |> process_operation(code, 0b1,     &["wink" | &1])
    |> process_operation(code, 0b10000, &Enum.reverse/1)
  end

  def process_operation(commands, code, check, operation) when (check &&& code) != 0 do
    operation.(commands)
  end
  def process_operation(commands, _, _, _), do: commands
end
