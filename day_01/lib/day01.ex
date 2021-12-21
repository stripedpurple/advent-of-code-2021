defmodule Day01 do
  def prompt do
    file_path = IO.gets "Data file: "
    file_path
    |> String.trim
  end

  def read_file (filename) do
    case File.read(filename) do
      {:ok, content} ->  String.split(content, "\n") |> Enum.map(fn x -> Integer.parse(x) end)
      {:error, _status} -> "Error reading file"
    end
  end

  def reduce (arr) do
    init = hd arr
    Enum.reduce(arr, {init, 0}, fn new, {old, acc} ->
      cond do
        new > old -> {new, acc + 1}
        true -> {new, acc}
      end
    end)
  end

  def reduce2 (arr) do
    once = Enum.at(arr, 1)
    twice = Enum.at(arr, 2)
    threeTimesALady = Enum.at(arr, 3)

    Enum.reduce(arr, {once, twice, threeTimesALady, 0}, fn new, {old, acc} ->
      cond do
        new > old -> {new, acc + 1}
        true -> {new, acc}
      end
    end)
  end

  def main do
    content = prompt()
    |> read_file

    reduce content
    reduce2 content
  end
end
