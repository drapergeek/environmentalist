defmodule EnvFileParser do
  def for_file(name) do
    {:ok, file} = File.read name
    file
    |> String.split("\n")
    |> remove_empty_and_comment_strings
    |> create_structs
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
