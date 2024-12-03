defmodule Day2 do
  def part1(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
    |> Enum.count(&valid_report?/1)
  end

  def part2(file_path) do
    file_path
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
    |> Enum.count(&valid_report_dampened?/1)
  end

  def valid_report_dampened?(report) do
    valid_report?(report) || is_less_safe(report)
  end

  def is_less_safe(report, idx \\ 0)
  def is_less_safe(report, idx) when length(report) == idx, do: false

  def is_less_safe(report, idx) do
    List.delete_at(report, idx)
    |> valid_report?()
    |> case do
      true -> true
      false -> is_less_safe(report, idx + 1)
    end
  end

  def valid_report?(report) do
    diffs =
      report
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.map(fn [a, b] -> b - a end)

    Enum.all?(diffs, fn num -> -3 <= num && num <= -1 end) ||
      Enum.all?(diffs, fn num -> 1 <= num && num <= 3 end)
  end

  def parse_line(str) do
    String.split(str, " ", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end
