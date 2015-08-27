defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence |> String.downcase
             |> String.replace(~r([!&@$%^&,:]), "\s")
             |> String.split(~r(\s|_), trim: true)
             |> Enum.reduce(%{}, &Dict.update(&2,&1, 1, fn(val) -> val + 1 end))
  end
end
