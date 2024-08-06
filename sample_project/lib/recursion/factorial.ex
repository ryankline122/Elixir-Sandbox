defmodule SampleProject.Recursion.Factorial do
  def factorial(1), do: 1
  def factorial(num) do
    num * factorial(num-1)
  end

  def factorial_tail(num, accum \\ 1)
  def factorial_tail(1, accum), do: accum
  def factorial_tail(num, accum) do
    factorial_tail(num-1, num * accum)
  end

end
