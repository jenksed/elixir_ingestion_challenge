
defmodule ElixirDataIngest.Aggregator.Spec do
  alias ElixirDataIngest.Record.Spec, as: Record

  @moduledoc """
  Solved puzzle for ElixirDataIngest.Aggregator
  """

  def aggregate(records) do
    records
    |> Enum.group_by(& &1.region)
    |> Enum.map(fn {region, records} ->
      {region, Enum.reduce(records, 0, &(&1.amount + &2))}
    end)
  end
end
