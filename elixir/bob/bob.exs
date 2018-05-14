defmodule Bob do
  def hey(input) do
    cond do
      input =~ ~r{^[ ]*$} -> "Fine. Be that way!"
      input =~ ~r{[A-Z]} && input =~ ~r{^[^a-z]+\?$} -> "Calm down, I know what I'm doing!"
      input =~ ~r{[A-ZА-Я]} && input =~ ~r{^[^a-z]+$} -> "Whoa, chill out!"
      input =~ ~r{\?$} -> "Sure."
      true -> "Whatever."
    end
  end
end
