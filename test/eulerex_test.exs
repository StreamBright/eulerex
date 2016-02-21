defmodule EulerexTest do
  use ExUnit.Case
  doctest Eulerex

  test "euler_001" do
    assert Eulerex.euler_001 == 233168
  end
  test "euler_002" do
    assert Eulerex.euler_002 == 4613732
  end
end
