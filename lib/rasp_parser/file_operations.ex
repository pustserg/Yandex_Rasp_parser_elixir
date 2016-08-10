defmodule RaspParser.FileOperations do
  @moduledoc false
  alias RaspParser.Models.City

  def read_cities do
    {:ok, cities} = File.read(
      Application.get_env(:rasp_parser, :input_cities_file_name)
    )
    String.split(cities, "\n")
      |> Enum.map(&String.split(&1, ";"))
      |> Enum.map(&create_city/1)
  end

  def write_results(results, results_type) do
    key = String.to_atom("#{results_type}_out_filename")
    file_name = Application.get_env(:rasp_parser, key)
    {:ok, file} = open_or_create_file(file_name)
    Enum.each(results, &IO.puts(file, RaspParser.Stringable.to_string(&1)))
    {File.close(file), results}
  end

  defp create_city(city_arr) do
    [name, code] = city_arr
    %City{name: name, code: code}
  end

  def open_or_create_file(file_name) do
    unless File.exists?(file_name) do
      File.touch file_name
    end
    File.open(file_name, [:write, :utf8])
  end
end