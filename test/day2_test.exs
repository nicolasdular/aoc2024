defmodule Day2Test do
  use ExUnit.Case, async: true
  import Day2
  doctest Day2

  test "valid_report?/1" do
    assert valid_report?([7, 6, 4, 2, 1])
    refute valid_report?([1, 2, 7, 8, 9])
    refute valid_report?([9, 7, 6, 2, 1])
    refute valid_report?([1, 3, 2, 4, 5])
    refute valid_report?([8, 6, 4, 4, 1])
    assert valid_report?([1, 3, 6, 7, 9])
  end

  test "valid_report_dampened?/1" do
    assert valid_report_dampened?([7, 6, 4, 2, 1])
    refute valid_report_dampened?([1, 2, 7, 8, 9])
    refute valid_report_dampened?([9, 7, 6, 2, 1])
    assert valid_report_dampened?([1, 3, 2, 4, 5])
    assert valid_report_dampened?([8, 6, 4, 4, 1])
    assert valid_report_dampened?([1, 3, 6, 7, 9])
  end

  test "part1" do
    assert 2 == part1("test/day2_test_input.txt")
  end

  test "part2" do
    assert 4 == part2("test/day2_test_input.txt")
  end
end
