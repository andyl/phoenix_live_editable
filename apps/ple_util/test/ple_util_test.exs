defmodule PleUtilTest do
  use ExUnit.Case
  doctest PleUtil

  test "greets the world" do
    assert PleUtil.hello() == :world
  end
end
