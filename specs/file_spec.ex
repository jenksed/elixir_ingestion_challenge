
defmodule ElixirDataIngest.File.Spec do
  alias ElixirDataIngest.Pipeline.Spec, as: Pipeline

  @moduledoc """
  Solved puzzle for ElixirDataIngest.File
  """

  def run(path) do
    path
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.reject(&(&1 == "" || String.starts_with?(&1, "#")))
    |> Enum.to_list()
    |> Pipeline.run()
  end
end
