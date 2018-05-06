defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char, non_neg_integer) :: non_neg_integer
  def count(strand, char, acc \\ 0)
  def count([], _, acc), do: acc
  def count([char|tl], char, acc), do: count(tl, char, acc + 1)
  def count([_|tl], char, acc), do: count(tl, char, acc)

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    @nucleotides
    |> Enum.into(%{}, &({&1, count(strand, &1)}))
  end
end
