defmodule EnvFileParserTest do
  use ExUnit.Case

  setup do
    File.rm_rf("tmp")
    File.mkdir("tmp")
    :ok
  end

  test "excludes commments and empty lines" do
    env_file = create_env_file ~s"""
    SOMETHING=test

    ANOTHER=test
    NEW_ITEM=something_here
    REQUIRED_ITEM=require-something
    REMOTE_ITEM=remote-staging
    #commented
    """

    parsed = EnvFileParser.for_file(env_file)

    assert Enum.count(parsed) == 5
  end

  test "creates a struct for each entry" do
    env_file = create_env_file ~s"""
    MY_KEY=my_value
    """
    [first_entry | _ ] = EnvFileParser.for_file(env_file)

    assert first_entry.key == "MY_KEY"
    assert first_entry.value == "my_value"
  end

  def create_env_file(text) do
    file_name = "tmp/env-#{:random.uniform(10000)}"
    File.write file_name, text, [:write]
    file_name
  end
end
