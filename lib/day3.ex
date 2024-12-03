defmodule Day3 do
  def part1(file_name) do
    input = File.read!(file_name)

    Regex.scan(~r/mul\((\d+),(\d+)\)/, input)
    |> Enum.map(fn [_, a, b] -> String.to_integer(a) * String.to_integer(b) end)
    |> Enum.sum()
  end

  def part2(file_name) do
    input = File.read!(file_name)

    Regex.scan(~r/mul\((\d+)\,(\d+)\)|do\(\)|don\'t\(\)/, input)
    |> Enum.reduce({0, false}, &parse_entry/2)
    |> elem(0)
  end

  def parse_entry(["don't()"], {counter, _skip}) do
    {counter, true}
  end

  def parse_entry(["do()"], {counter, _skip}) do
    {counter, false}
  end

  def parse_entry([_, a, b], {counter, false}) do
    {counter + String.to_integer(a) * String.to_integer(b), false}
  end

  def parse_entry(_, acc) do
    acc
  end
end
