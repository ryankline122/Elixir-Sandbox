defmodule SampleProject.Recursion.SumDigits do
  def sum(0), do: 0

  def sum(num) do
    sum_tail_rec(num)
  end

  # Sets default accum arg to 0
  def sum_tail_rec(num, accum \\ 0)
  def sum_tail_rec(0, accum), do: accum

  # Tail recursion is preferred since they use less memory and stack is reused
  def sum_tail_rec(num, accum) do
    sum_tail_rec(num - 1, accum + num)
  end

end
