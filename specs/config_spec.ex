
defmodule ElixirDataIngest.Config.Spec do
  use GenServer

  @moduledoc """
  Solved puzzle for ElixirDataIngest.Config
  """

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(columns) do
    {:ok, columns}
  end

  def handle_call(:get_columns, _from, state) do
    {:reply, state, state}
  end

  def get_columns do
    GenServer.call(__MODULE__, :get_columns)
  end
end
