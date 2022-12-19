defmodule Phoenix.LiveEditable.Util do
  def random_id do
    for _ <- 1..7, into: "", do: <<Enum.random('0123456789abcdefghijklmnopqrstuvwxyz')>>
  end
end
