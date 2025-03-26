defmodule NervesFlutterExampleTest do
  use ExUnit.Case
  doctest DashElixirFlutter

  test "greets the world" do
    assert DashElixirFlutter.hello() == :world
  end
end
