defmodule Sandbox do
  # creating a struct
  defstruct(username: "", email: "", age: nil)
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
    [1, ^a, 3] = [1, 1, 3]
    # [1, ^a, 3] = [1, 2, 3]    # This throws error, ^ won't let you redefine 'a'
    [1, a, 3] = [1, 2, 3]       # This is fine

    IO.puts(a)
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
    {a, b} = {1, 2}
    IO.puts(a)

    {:reply, msg, state} = {:reply, "Some message", ["some", "state"]}
    IO.puts(msg)
    IO.puts(state)

    # Keyword list - key/val pair where keys are atoms
    data = [a: 1, b: 2]
    IO.puts(data[:a])             # Keys are saved as atoms

    # Maps - key/val pairs with many data types
    my_map = %{a: 1, b: 2, c: 3}
    %{a: first, b: second, c: third} = my_map
    IO.puts(first)

    %{b: second} = my_map         # Extracting value from map when keys are atoms
    IO.puts(second)
    IO.puts(my_map.b)

    map2 = %{"a" => 1, "b" => 2, "c" => 3}        # Non-atom keys use => notation
    %{"c" => c} = map2
    IO.puts(c)

    map2 = %{map2 | "c" => 4}                     # Updating values (non-atom keys)
    my_map = %{my_map | c: 4}                     # Updating values (atoms keys)
    %{"c" => c} = map2
    IO.puts(c)

    # Structs
    user = %Sandbox{username: "Ryan", email: "test@example.com", age: 24}
    IO.puts(user.email)

    ^user = %{user | age: 25}                      # Updating struct values
    IO.puts(user.age)
  end

  def flowControl() do
    list = [1,2,3]

    result = case Enum.at(list, 2) do
      1 -> "Case 1"
      3 -> "Case 2"
      _ -> "Default case"
    end

    IO.puts(result)
  end


end

# Run with `elixir sandbox.exs`
# Compile to BEAM btyecode with `elixirc sandbox.exs`

# Sandbox.helloWorld()
# Sandbox.countTo(0, 3)
# Sandbox.patternMatching()
# Sandbox.dataTypes()
Sandbox.flowControl()
