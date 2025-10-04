defmodule ElixirDataIngest.Application do
  @moduledoc false
  use Application

  # Challenge 14:
  # Add ElixirDataIngest.Config to the supervision tree
  # so it starts with the application.
  def start(_type, _args) do
    children = []
    opts = [strategy: :one_for_one, name: ElixirDataIngest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
