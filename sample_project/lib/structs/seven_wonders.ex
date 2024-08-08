defmodule SampleProject.Structs.SevenWonders do
  defstruct name: "", country: ""

  alias SampleProject.Structs.SevenWonders
  @type t :: %SevenWonders{
    name: String.t(),
    country: String.t(),
  }

  @spec all() :: [t()]
  def all() do
    [
      %SevenWonders{name: "Taj Mahal", country: "India"},
      %SevenWonders{name: "Chichen Itza", country: "Mexico"},
      %SevenWonders{name: "Petra", country: "Jordan"},
      %SevenWonders{name: "Machu Picchu", country: "Peru"},
      %SevenWonders{name: "Christ the Redeemer", country: "Brazil"},
      %SevenWonders{name: "Colosseum", country: "Italy"},
      %SevenWonders{name: "The Great Wall of China", country: "China"},
    ]
  end

  @spec print_names() :: :ok
  def print_names() do
    Enum.each(all(), fn x -> IO.puts(x.name) end)
  end

  def filter_by_country(country) do
    Enum.filter(all, fn x -> x.country == country end)
  end
end
