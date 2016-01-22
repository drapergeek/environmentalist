defmodule EnvFileHandler do
  def parse(name) do
    {:ok, file} = File.read name
    file
    |> String.split("\n")
    |> remove_empty_and_comment_strings
    |> create_structs
  end

  def write_keys(file_name, differences) do
    Enum.each differences.missing, fn (entry) ->
      File.write file_name, format_entry(entry), [:append]
    end
  end

  defp format_entry(entry) do
    entry.key <> "=" <> entry.value
  end

  defp remove_empty_and_comment_strings(list) do
    Enum.filter list, fn (string) ->
      String.length(string) >= 1 && !String.starts_with?(string, "#")
    end
  end

  defp create_structs(list) do
    Enum.map list, fn (entry) ->
      EnvironmentEntry.parse(entry)
    end
  end
end
