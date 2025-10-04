
defmodule ElixirDataIngest.Transformer.Spec do
  alias ElixirDataIngest.Record.Spec, as: Record

  @moduledoc """
  Solved puzzle for ElixirDataIngest.Transformer
  """

  def transform(lines) do
    lines
    |> Enum.map(&String.split(&1, ","))
    |> Enum.map(fn [id, date, amount, region] ->
      %Record{id: id, date: date, amount: String.to_float(amount), region: region}
    end)
  end
end
