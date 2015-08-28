defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal
  def compare(a, b), do: compare(a, b, length(a) < length(b))

  def compare(a, b, true) , do: compare_lists(a, b, length(a), :sublist)
  def compare(a, b, false), do: compare_lists(b, a, length(b), :superlist)

  defp compare_lists(a,b, a_length, result) do
    cond do
      a_length > length(b) ->
        :unequal
      a === Enum.slice(b,0,a_length) ->
        result
      true ->
        compare_lists(a, tl(b), a_length, result)
    end
  end
end
