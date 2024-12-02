defmodule Day1 do
  @input_file "lib/day1_input.txt"

  def part1(file \\ @input_file) do
    parse(file)
    |> pair_smallest_numbers()
    |> add_up_distance()
  end

  def part2(file \\ @input_file) do
    list = parse(file)

    appaerance =
      Enum.map(list, &List.last/1)
      |> Enum.frequencies()

    list
    |> Enum.reduce(0, fn [number, _], acc ->
      acc + number * Map.get(appaerance, number, 0)
    end)
  end

  def add_up_distance(list) do
    Enum.map(list, fn [first, second] -> abs(first - second) end)
    |> Enum.sum()
  end

  def pair_smallest_numbers(list) do
    left_array = Enum.map(list, &List.first/1) |> Enum.sort()
    right_array = Enum.map(list, &List.last/1) |> Enum.sort()

    Enum.zip(left_array, right_array)
    |> Enum.map(fn {first, second} -> [first, second] end)
  end

  def parse(file) do
    file
    |> File.read!()
    |> String.split("\n")
    |> Enum.map(&parse_line/1)
    |> Enum.reject(&is_nil/1)
  end

  defp parse_line(line) do
    case String.split(line, " ", trim: true) do
      [first, last] ->
        [String.to_integer(first), String.to_integer(last)]

      _ ->
        nil
    end
  end
end
