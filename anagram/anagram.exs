defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    base_char = base |> String.downcase |> String.to_char_list

    match? = fn(candidate) ->
      String.length(base) == String.length(candidate) &&
      (base_char -- String.to_char_list(String.downcase(candidate)) == []) &&
      String.downcase(candidate) != String.downcase(base)
    end

    Enum.filter(candidates, match?)
  end
end
