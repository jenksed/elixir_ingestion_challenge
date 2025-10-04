
defmodule ElixirDataIngest.Pipeline.Spec do
  alias ElixirDataIngest.Parser.Spec, as: Parser
  alias ElixirDataIngest.Transformer.Spec, as: Transformer
  alias ElixirDataIngest.Validator.Spec, as: Validator
  alias ElixirDataIngest.Aggregator.Spec, as: Aggregator

  @moduledoc """
  Solved puzzle for ElixirDataIngest.Pipeline
  """

  def run(csv) do
    with lines <- Parser.parse(csv),
         records <- Transformer.transform(lines),
         validated_records <- Validator.validate(records) do
      Aggregator.aggregate(validated_records)
    end
  end
end
