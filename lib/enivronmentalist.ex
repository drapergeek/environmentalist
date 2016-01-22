defmodule Enivronmentalist do
  def main(args) do
    args |> parse_args |> process
  end

  def process([]) do
  end

  def process(options) do
    sample_file = EnvFileParser.for_file(options[:sample_file])
    actual_file = EnvFileParser.for_file(options[:actual_file])
    differences = EnvFileComparison.compare(sample_file, actual_file)
    EnvFileHandler.write_keys(options[:actual_file], differences)
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args)
    options
  end
end
