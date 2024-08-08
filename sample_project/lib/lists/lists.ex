defmodule SampleProject.Lists do
  @moduledoc """

  Function Summary:

  1. sum
  """

  @doc """
  Returns the sum of the numbers in a list.
  """
  # Sum
  @spec sum(list(number())) :: number()
  def sum([]), do: 0
  def sum([h | t]), do: h + sum(t)

  @spec sum_tail(list(number()), number()) :: number()
  def sum_tail(nums, accum \\ 0)
  def sum_tail([], accum), do: accum
  def sum_tail([h | t], accum), do: sum_tail(t, accum + h)

  # Reverse
  @spec rev_ll([any()], [any()]) :: [any()]
  def rev_ll(nums, accum \\ [])
  def rev_ll([], accum), do: accum
  def rev_ll([h | t], accum), do: rev_ll(t, [h | accum])

  # Map
  @spec map([any()], (any() -> any()), [any()]) :: [any()]
  def map(elements, func, accum \\ [])
  def map([], _, accum), do: accum |> rev_ll()
  def map([h | t], func, accum), do: map(t, func, [func.(h) | accum])

  # Concat
  def concat(list1, list2, accum \\ [])
  def concat([], [], accum), do: accum |> rev_ll()
  def concat([h1 | t1], [], accum), do: concat(t1, [], [h1 | accum])
  def concat([], [h2 | t2], accum), do: concat([], t2, [h2 | accum])
  def concat([h1 | t1], [h2 | t2], accum), do: concat(t1, [h2 | t2], [h1 | accum])

  #[1,2,3], [4,5,6]
  #[3,2,1], [4,5,6]
  #[2,1], [3,4,5,6]
  #[1], [2,3,4,5,6]
  #[], [1,2,3,4,5,6]
  def concat_v2(src, dst), do: concat_func(src |> rev_ll(), dst)
  defp concat_func([], dst), do: dst
  defp concat_func([h | t], dst), do: concat_func(t, [h | dst])

  # Flat Map
  def flat_map(list, func, accum \\ [])
  def flat_map([], _, accum), do: accum
  def flat_map([h | t], func, accum) do
    flat_map(t, func, concat_v2(accum, func.(h)))
  end
end
