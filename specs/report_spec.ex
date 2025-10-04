
defmodule ElixirDataIngest.Report.Spec do
  @moduledoc """
  Solved puzzle for ElixirDataIngest.Report
  """

  def sort(aggregated_data) do
    Enum.sort_by(aggregated_data, &elem(&1, 1), :desc)
  end
end
