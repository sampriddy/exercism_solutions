defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase::String.t())::String.t()
  def translate(phrase) do
    phrase
    |> String.split
    |> Enum.map(&pig_latinize_word/1)
    |> Enum.join(" ")
  end

  defguard is_vowel(letter) when letter in ~w(a e i o u)
  defguard is_vowel_group(letter1, letter2) when letter1 in ~w(x y) and letter2 not in ~w(a e i o u)

  def pig_latinize_word(<<letter1::bytes-size(1), letter2::bytes-size(1), _::binary>> = word)
    when is_vowel(letter1)
    when is_vowel_group(letter1, letter2) do
    word <> "ay"
  end
  def pig_latinize_word(word) do
    pig_latinize_consonant_start(word, "")
  end

  def pig_latinize_consonant_start(word, consonant_group)
  def pig_latinize_consonant_start(<<"qu", rest::binary>>, consonant_group) do
    rest <> consonant_group <> "quay"
  end
  def pig_latinize_consonant_start(<<letter::bytes-size(1), rest::binary>> = word, consonant_group)
    when letter in ~w(a e i o u) do
    word <> consonant_group <> "ay"
  end
  def pig_latinize_consonant_start(<<letter::bytes-size(1), rest::binary>>, consonant_group) do
    pig_latinize_consonant_start(rest, consonant_group <> letter)
  end
end
