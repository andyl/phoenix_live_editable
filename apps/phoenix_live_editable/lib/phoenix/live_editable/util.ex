defmodule Phoenix.LiveEditable.Util do

  @moduledoc """
  Utility methods for Phoenix.LiveEditable.
  """

  @doc """
  Generate a seven-character random ID.
  """
  def random_id do
    for _ <- 1..7, into: "", do: <<Enum.random('0123456789abcdefghijklmnopqrstuvwxyz')>>
  end
end
