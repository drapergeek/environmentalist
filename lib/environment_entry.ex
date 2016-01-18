defmodule EnvironmentEntry do
  defstruct key: "", value: ""

  def parse(line) do
    [key, value] = String.split(line, "=")
    %EnvironmentEntry{key: key, value: value}
  end
end
