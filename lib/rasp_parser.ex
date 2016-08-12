defmodule RaspParser do
    def main(argv \\ []) do
      process
      System.halt(0)
    end

    def process do
      {:ok, directions} = RaspParser.FileOperations.read_cities
        |> Enum.map(&RaspParser.Models.City.url/1)
        |> Enum.flat_map(&RaspParser.Parsers.parse_city/1)
        |> RaspParser.FileOperations.write_results("directions")
      Enum.map(directions, &RaspParser.Parsers.parse_direction/1)
    end

    defprotocol Stringable do
      def to_string(resource)
    end
end
