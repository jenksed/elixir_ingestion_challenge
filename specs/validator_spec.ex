
defmodule ElixirDataIngest.Validator.Spec do
  alias ElixirDataIngest.Record.Spec, as: Record

  @moduledoc """
  Solved puzzle for ElixirDataIngest.Validator
  """

  def validate(records) do
    records
    |> Enum.reject(&invalid_record?/1)
  end

  defp invalid_record?(%Record{id: nil}) do
    true
  end

  defp invalid_record?(%Record{id: ""}) do
    true
  end

  defp invalid_record?(%Record{date: date}) do
    case Date.from_iso8601(date) do
      {:ok, _} -> false
      _ -> true
    end
  end

  defp invalid_record?(_record) do
    false
  end
end
