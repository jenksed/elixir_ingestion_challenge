
defmodule ElixirDataIngest.CLI.Spec do
  alias ElixirDataIngest.Pipeline.Spec, as: Pipeline
  alias ElixirDataIngest.Report.Spec, as: Report

  @moduledoc """
  Solved puzzle for ElixirDataIngest.CLI
  """

  @type report :: [{String.t(), number()}]

  @spec run(String.t()) :: {:ok, report} | {:error, any}
  def run(csv) do
    with aggregated_data <- Pipeline.run(csv) do
      sorted_data = Report.sort(aggregated_data)
      {:ok, sorted_data}
    end
  end
end
