defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    ~r{[_ ,?!@#$%^&*()_+=.:]+}
    |> Regex.split(sentence)
    |> Enum.reject(&(&1 == ""))
    |> Enum.map(&String.downcase/1)
    |> Enum.reduce(%{}, fn(word, acc) ->
      case acc[word] do
        nil -> Map.merge(acc, %{word => 1})
        _ -> Map.merge(acc, %{word => acc[word] + 1})
      end
    end)
  end
end
