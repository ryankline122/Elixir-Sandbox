defmodule Basics do
  def variables() do
    number = 1
    hexInt = 0x1F
    floatingPoint = 1.2
    bool = true
    symbol = :atom
    str = "string"
    lst = [1, 2, 3]
    tuple = {1, 2, 3}

    [number, hexInt, floatingPoint, bool, symbol, str, lst, tuple]
  end
end

IO.inspect(Basics.variables())
