defmodule RaspParser do
    def main(argv \\ []) do
      process
      System.halt(0)
    end

    def process do
        RaspParser.FileOperations.read_cities
          |> Enum.map(&RaspParser.Models.City.url/1)
          |> Enum.flat_map(&RaspParser.Parsers.parse_city/1)
          |> IO.inspect
    end
end
