defmodule EnvFileComparison do
  def compare(sample_file, actual_file) do
    sample_keys = keys_for(sample_file)
    actual_keys = keys_for(actual_file)
    IO.inspect(sample_keys)
    IO.inspect(actual_keys)

    %{missing: []}
  end

  defp keys_for(list) do
    Enum.map list, fn (item) -> item.key end
  end
end
