defmodule TwelveDays do
  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    "On the #{number_adjective(number)} day of Christmas my true love gave to me, #{gifts(number)}."
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    (starting_verse..ending_verse)
    |> Enum.map(&verse/1)
    |> Enum.join("\n")
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses(1, 12)
  end

  defp number_adjective(number)
  defp number_adjective(1), do: "first"
  defp number_adjective(2), do: "second"
  defp number_adjective(3), do: "third"
  defp number_adjective(4), do: "fourth"
  defp number_adjective(5), do: "fifth"
  defp number_adjective(6), do: "sixth"
  defp number_adjective(7), do: "seventh"
  defp number_adjective(8), do: "eighth"
  defp number_adjective(9), do: "ninth"
  defp number_adjective(10), do: "tenth"
  defp number_adjective(11), do: "eleventh"
  defp number_adjective(12), do: "twelfth"

  defp gifts(number)
  defp gifts(1), do: "a Partridge in a Pear Tree"
  defp gifts(2), do: "two Turtle Doves, and " <> gifts(1)
  defp gifts(3), do: "three French Hens, " <> gifts(2)
  defp gifts(4), do: "four Calling Birds, " <> gifts(3)
  defp gifts(5), do: "five Gold Rings, " <> gifts(4)
  defp gifts(6), do: "six Geese-a-Laying, " <> gifts(5)
  defp gifts(7), do: "seven Swans-a-Swimming, " <> gifts(6)
  defp gifts(8), do: "eight Maids-a-Milking, " <> gifts(7)
  defp gifts(9), do: "nine Ladies Dancing, " <> gifts(8)
  defp gifts(10), do: "ten Lords-a-Leaping, " <> gifts(9)
  defp gifts(11), do: "eleven Pipers Piping, " <> gifts(10)
  defp gifts(12), do: "twelve Drummers Drumming, " <> gifts(11)
end
