defmodule Enivronmentalist do
  def main(args) do
    args |> parse_args |> process
  end

  def process([]) do
    IO.puts "No arguments given"
  end

  def process(options) do
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args)
    options
  end
end
