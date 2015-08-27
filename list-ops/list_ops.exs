defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l)         , do: count(l, 0)
  def count([_|t], acc), do: count(t, acc+1)
  def count([], acc)   , do: acc

  @spec reverse(list) :: list
  def reverse(l)         , do: reverse(l, [])
  def reverse([h|t], acc), do: reverse(t, [h|acc])
  def reverse([], acc)   , do: acc

  @spec map(list, (any -> any)) :: list
  def map(l, f)         , do: map(l, f, [])
  def map([h|t], f, acc), do: map(t, f, [f.(h)| acc])
  def map([], _, acc)   , do: reverse(acc)

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f)                , do: filter(l, f, [])
  def filter([h|t], f, acc)       , do: filter([h|t], f, acc, f.(h))
  def filter([], _, acc)          , do: reverse(acc)
  def filter([h|t], f, acc, true) , do: filter(t, f, [h|acc])
  def filter([_|t], f, acc, false), do: filter(t, f, acc)

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([h|t], acc, f), do: reduce(t, f.(h,acc), f)
  def reduce([], acc, _)   , do: acc

  @spec append(list, list) :: list
  def append(a, b), do: append(a, b, false)
  def append(a, b, false), do: a |> reverse |> append(b, true)
  def append([h|t], b, true), do: append(t, [h|b], true)
  def append([], b, true), do: b

  @spec concat([[any]]) :: [any]
  def concat(ll), do: concat(ll, [])
  def concat([[element_h|element_t]|t], acc), do: concat([element_t|t], [element_h|acc])
  def concat([[]|t], acc), do: concat(t, acc)
  def concat([], acc), do: reverse(acc)
end
