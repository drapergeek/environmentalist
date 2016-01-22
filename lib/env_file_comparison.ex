defmodule EnvFileComparison do
  def compare(sample_file, actual_file) do
    sample_keys = keys_for(sample_file)
    actual_keys = keys_for(actual_file)
    missing_keys = sample_keys -- actual_keys

    %{missing: entries_with_keys(sample_file, missing_keys)}
  end

  defp keys_for(list) do
    Enum.map list, fn (item) -> item.key end
  end

  defp entries_with_keys(list, keys) do
    Enum.filter list, fn (item) -> Enum.member?(keys, item.key) end
  end
end
