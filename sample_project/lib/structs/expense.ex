defmodule SampleProject.Structs.Expense do
  alias SampleProject.Structs.Expense

  defstruct(
    title: "",
    date: nil,
    amount: 0,
    store: "",
  )

  @type t :: %Expense{
    title: String.t(),
    date: Date.t() | nil,
    amount: number(),
    store: String.t(),
  }
  def expenses() do
    [
      %Expense{title: "Grocery", date: ~D[2024-08-10], amount: 19.99, store: "Aldi"},
      %Expense{title: "Gas", date: ~D[2024-08-11], amount: 49.99, store: "Marathon"},
      %Expense{title: "Rent", date: ~D[2024-08-01], amount: 499.99, store: "Herm"},
    ]
  end

  def total() do
    expenses |> Enum.reduce(0, fn expense, total -> total + expense.amount end)
  end

  def update_amount(title, amount) do
    [item] = Enum.filter(expenses(), fn x -> x.title == title end)
    updated_item = %{item | amount: amount}

    [updated_item | List.delete(expenses(), item)]
  end


  # Function guards
  @users ["user1", "user2", "user3"]

  def authenticate(user) when user in @users, do: {:ok, "authorized"}
  def authenticate(_), do: {:error, "invalid username"}

  def verify_password(user, _password) when user in @users, do: {:ok, "password verified"}
  def verify_password(_user, _password), do: {:error, "incorrect password"}

  def login(user, password) do
    with {:ok, _msg} <- authenticate(user),
    {:ok, _msg} <- verify_password(user, password) do
      {:ok, "#{user} logged in successfully"}
    else
      {:error, msg} -> {:error, msg}
      _ -> :unauthorized
    end
  end
end
