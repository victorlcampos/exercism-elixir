defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  @change %{?G => ?C, ?C => ?G, ?T => ?A, ?A => ?U }
  def to_rna(dna), do: dna |> Enum.map(&(@change[&1]))
end
