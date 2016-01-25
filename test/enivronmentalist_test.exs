defmodule EnivronmentalistTest do
  use ExUnit.Case
  doctest Enivronmentalist
  import EnvHelper

  setup do
    clear_files
  end

  test "it adds missing entries" do
    sample = create_env_file ~s"""
    SOMETHING=test
    """
    actual = create_env_file ""

    Enivronmentalist.process(sample: sample, actual: actual)

    {:ok, file_text} = File.read actual

    assert String.contains?(file_text, "SOMETHING=test")
  end
end
