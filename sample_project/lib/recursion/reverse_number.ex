defmodule SampleProject.Recursion.ReverseNumber do
  def reverse_number(num, accum \\ 0)
  def reverse_number(0, accum), do: accum
  def reverse_number(num, accum) do
    reverse_number(div(num, 10), ((accum * 10) + rem(num, 10)))
  end
end
