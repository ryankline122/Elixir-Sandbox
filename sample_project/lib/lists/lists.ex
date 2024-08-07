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
end
