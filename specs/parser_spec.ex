
defmodule ElixirDataIngest.Parser.Spec do
  @moduledoc """
  Solved puzzle for ElixirDataIngest.Parser
  """

  def parse(csv) when is_binary(csv) do
    csv
    |> String.trim()
    |> String.split("\n", trim: true)
  end
end
