defmodule EnvFileComparisonTest do
  use ExUnit.Case

  test "compare includes any missing entries" do
    sample = [%EnvironmentEntry{key: "NAME", value: "bob"}]
    actual = []
    difference = EnvFileComparison.compare(sample, actual)

    assert List.first(difference.missing).key == "NAME"
  end
end
