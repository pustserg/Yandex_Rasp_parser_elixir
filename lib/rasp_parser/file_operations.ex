defmodule RaspParser.FileOperations do
  @moduledoc false
  alias RaspParser.Models.City

  def read_cities do
    {:ok, cities} = File.read(
        Application.get_env(:rasp_parser, :input_cities_file_name)
    )
    String.split(cities, "\n")
        |> Enum.map(fn(str) -> String.split(str, ";") end)
        |> Enum.map(fn(arr) -> create_city(arr) end)
  end

  defp create_city(city_arr) do
    [name, code] = city_arr
    %City{name: name, code: code}
  end
end