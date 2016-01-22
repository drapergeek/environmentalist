defmodule EnvFileHandler do
  def write_keys(file_name, differences) do
    Enum.each differences.missing, fn (entry) ->
      File.write file_name, format_entry(entry), [:append]
    end
  end

  defp format_entry(entry) do
    entry.key <> "=" <> entry.value
  end
end

