defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2), do: hamming_distance(strand1, strand2, 0)
  def hamming_distance([ha|ta], [ha|tb], acc), do: hamming_distance(ta, tb, acc)
  def hamming_distance([_|ta], [_|tb], acc), do: hamming_distance(ta, tb, acc+1)
  def hamming_distance([], [], acc), do: acc
  def hamming_distance([], _, _), do: nil
  def hamming_distance(_, [], _), do: nil
end
