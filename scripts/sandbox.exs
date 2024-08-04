defmodule Sandbox do
  @moduledoc """
  Just playing around.
  """
  def helloWorld() do
    IO.puts("Hello world!")
  end

  def countTo(x \\ 0, y \\ 0) do
    IO.puts(x)

    Process.sleep(500)

    if x < y do
      countTo(x+1, y)
    end
  end

  def patternMatching() do
    a = 1
    # ^a = 2 - Returns match error
    a = 2  # ignores immuatablity rule

    IO.puts("A is: #{a}")
  end

  @doc"""
  All data types are Immutable (aka Constant)
  """
  def dataTypes() do
    # Atoms - name and the value is the same
    :some_name
    :"Hello world!!"
    :error

    {:error, reason} = {:error, "file not found"}

    IO.puts(:some_name)
    IO.puts(:"Hello world!!")
    IO.puts(reason)

    # Strings -  double quotes only. Bits encoded in UTF-8
    name = "Ryan"                   # Raw representation: <<82, 121, 97, 110>>
    "R" <> rest = "Ryan"            # Binds substring after "R" to `rest` variable
    IO.puts(rest)

    greeting = "Hello " <> name     # String concatination
    IO.puts(greeting)

    "Hello " <> name2 = greeting    # extract values from strings with pattern matching
    IO.puts(name2)

    <<head, rest::binary>> = name   # matches `head` to ascii value of the first letter in `name`
    IO.puts(head)

    <<head, rest::binary>> = name
    IO.puts(<<head::utf8>>)         # convert binary value to string value with utf8 encoding

    <<"Ry", rest::binary>> = name
    IO.puts(rest)

    # Character list - Single quotes
    chars = 'Ryan'                  # Raw representation: [82, 121, 97, 110]
    msg = 'Hello ' ++ chars         # Char list concatenation
    IO.puts(msg)

    # Processes
    my_pid = self()

    # Lists - are singly linked lists
    list = ["a", "b", "c"]
    # list[0]                         # Throws error. Lists are not indexed
    index0 = Enum.at(list, 0)         # Enum module provides algorithms for dealing with enumable data
    IO.puts(index0)

    [first, second, third] = list
    IO.puts(second)

    [_, _, third] = list              # Ignores first two values of the list
    IO.puts(third)

    IO.puts(hd(list))                 # Returns head of list
    IO.puts(tl(list))                 # Returns rest of list after head

    [h | t] = list                    # Think of car/cdr from scheme
    IO.puts(h)
    IO.puts(t)

    # Tuples & Keyword lists
    


  end
end

# Run with `elixir sandbox.exs`
# Compile to BEAM btyecode with `elixirc sandbox.exs`
# Sandbox.helloWorld()
# Sandbox.countTo(0, 3)
# Sandbox.patternMatching()
Sandbox.dataTypes()
