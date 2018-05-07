  defmodule RotationalCipher do
    @lower ?a..?z
    @upper ?A..?Z

    @doc """
    Given a plaintext and amount to shift by, return a rotated string.

    Example:
    iex> RotationalCipher.rotate("Attack at dawn", 13)
    "Nggnpx ng qnja"
    """
    @spec rotate(text :: String.t(), shift :: integer) :: String.t()
    def rotate("", _shift), do: ""
    def rotate(<<head, tail :: binary>>, shift) when head in @lower do
      new_head = rem(head - ?a + shift, 26) + ?a
      <<new_head, rotate(tail, shift) :: binary>>    
    end
    def rotate(<<head, tail :: binary>>, shift) when head in @upper do
      new_head = rem(head - ?A + shift, 26) + ?A
      <<new_head, rotate(tail, shift) :: binary>>
    end
    def rotate(<<head, tail :: binary>>, shift) do
      <<head, rotate(tail, shift) :: binary>>
    end
  end
