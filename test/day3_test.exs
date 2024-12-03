defmodule Day3Test do
  use ExUnit.Case, async: true
  import Day3
  doctest Day3

  test "part1/1" do
    assert 161 == part1("test/day3_test_input.txt")
  end

  test "part2/1" do
    assert 48 == part2("test/day3_test_input.txt")
  end
end
