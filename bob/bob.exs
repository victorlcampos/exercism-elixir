defmodule Teenager do
  def hey(input) do
    cond do
      silence?(String.strip(input)) ->
        "Fine. Be that way!"
      yell?(input) ->
        "Whoa, chill out!"
      ask?(input) ->
        "Sure."
      true -> "Whatever."
    end
  end

  defp silence?(""), do: true
  defp silence?(_), do: false

  defp yell?(input), do: String.upcase(input) == input && String.downcase(input) != input
  defp ask?(input), do: String.last(input) == "?"
end
