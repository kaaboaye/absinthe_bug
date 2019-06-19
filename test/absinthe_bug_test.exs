defmodule AbsintheBugTest do
  use ExUnit.Case
  doctest AbsintheBug

  test "greets the world" do
    assert AbsintheBug.hello() == :world
  end
end
