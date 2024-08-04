defmodule SampleProject.Recursion.PrintDigits do
  # Pattern matching applies to functions as well
  # Base case - returns a single value
  def upTo(0), do: IO.puts(0)

  def upTo(num) do
    # IO.puts(num)      # Prints in descending order (tail recursion)
    upTo(num - 1)
    IO.puts(num)      # Prints in ascending order (head recursion)
  end
end
