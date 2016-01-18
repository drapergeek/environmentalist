defmodule EnvFileParserTest do
  use ExUnit.Case

  test "excludes commments and empty lines" do
    file_name = ".env.base"
    parsed = EnvFileParser.for_file(file_name)

    assert Enum.count(parsed) == 5
  end

  test "creates a struct for each entry" do
    file_name = ".env.base"
    [first_entry | _ ] = EnvFileParser.for_file(file_name)

    assert first_entry.key == "SOMETHING"
    assert first_entry.value == "test"
  end
end
