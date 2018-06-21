defmodule MywebappTest do
  use ExUnit.Case
  doctest Mywebapp

  test "greets the world" do
    assert Mywebapp.hello() == :world
  end
end
