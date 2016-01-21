defmodule EnvHelper do
  def clear_files do
    File.rm_rf("tmp")
    File.mkdir("tmp")
    :ok
  end

  def create_env_file(text) do
    file_name = "tmp/env-#{:random.uniform(10000)}"
    File.write file_name, text, [:write]
    file_name
  end
end
