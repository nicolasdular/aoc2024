defmodule Day1Test do
  use ExUnit.Case, async: true
  import Day1
  doctest Day1

  @test_array [
    [3, 4],
    [4, 3],
    [2, 5],
    [1, 3],
    [3, 9],
    [3, 3]
  ]

  @smallest_numbers [
    [1, 3],
    [2, 3],
    [3, 3],
    [3, 4],
    [3, 5],
    [4, 9]
  ]

  test "parse/1" do
    assert @test_array = parse("test/day1_test_input.txt")
  end

  test "pair_smallest_numbers/1" do
    assert @smallest_numbers =
             pair_smallest_numbers(@test_array)
  end

  test "part1/1" do
    assert 11 = part1("test/day1_test_input.txt")
  end

  test "part2/1" do
    assert 31 = part2("test/day1_test_input.txt")
  end
end
