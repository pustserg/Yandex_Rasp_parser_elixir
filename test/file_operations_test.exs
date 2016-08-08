defmodule FileOperationsTest do
  use ExUnit.Case
  doctest RaspParser.FileOperations
  alias RaspParser.Models.City

  test "read_cities" do
    expected = [
      %City{name: "city_name_1", code: "city_code_1"},
      %City{name: "city_name_2", code: "city_code_2"}
    ]
    got = RaspParser.FileOperations.read_cities

    assert expected == got
  end
end