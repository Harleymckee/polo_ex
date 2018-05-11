defmodule ExAlienSocketTest do
  use ExUnit.Case
  doctest ExAlienSocket

  test "greets the world" do
    assert ExAlienSocket.hello() == :world
  end
end
