defmodule HammoxExampleTest do
  use ExUnit.Case
  doctest HammoxExample

  test "greets the world" do
    assert HammoxExample.hello() == :world
  end
end
