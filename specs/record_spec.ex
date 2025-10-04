
defmodule ElixirDataIngest.Record.Spec do
  @moduledoc """
  Solved puzzle for ElixirDataIngest.Record
  """

  @enforce_keys [:id, :date, :amount]
  defstruct [:id, :date, :amount, :region]
end
