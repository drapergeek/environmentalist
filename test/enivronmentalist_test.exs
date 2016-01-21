defmodule EnivronmentalistTest do
  use ExUnit.Case
  doctest Enivronmentalist
  import EnvHelper

  setup do
    clear_files
  end

  test "it adds missing entries" do
    sample_file = create_env_file ~s"""
    SOMETHING=test
    """
    actual_file = create_env_file ""

    Enivronmentalist.process(sample_file: sample_file, actual_file: actual_file)

    {:ok, file_text} = File.read actual_file

    assert String.contains?(file_text, "SOMETHING=test")
  end
end
