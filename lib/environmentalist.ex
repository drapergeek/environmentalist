defmodule Environmentalist do
  def main(args) do
    args |> parse_args |> process
  end

  def process({[version: _], []}) do
    IO.puts "0.0.1"
  end

  def process({_, []}) do
    process([".sample.env", ".env"])
  end

  def process({_, [_]}) do
    IO.puts "You must provide the location of both the sample and the actual file"
  end

  def process({_, [sample, actual]}) do
    process([sample, actual])
  end

  def process([sample, actual]) do
    sample_file = EnvFileHandler.parse(sample)
    actual_file = EnvFileHandler.parse(actual)
    differences = EnvFileComparison.compare(sample_file, actual_file)
    EnvFileHandler.write_keys(actual, differences)
  end

  defp parse_args(args) do
    {options, files, _} = OptionParser.parse(args)
    IO.inspect {options, files}
  end
end
