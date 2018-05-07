defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna, acc \\ [])
  def of_rna("", acc), do: {:ok, Enum.reverse(acc)}
  def of_rna(<<codon :: bytes-size(3), remaining :: binary>>, acc) do
    case of_codon(codon) do
      {:ok, "STOP"} -> {:ok, Enum.reverse(acc)}
      {:ok, result} -> of_rna(remaining, [result | acc])
      _             -> {:error, "invalid RNA"}
    end
  end

  @doc """
  Given a codon, return the corresponding protein
  """

  @translation %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    case @translation do
      %{^codon => result} -> {:ok, result}
      _ -> {:error, "invalid codon"}
    end
  end
end
