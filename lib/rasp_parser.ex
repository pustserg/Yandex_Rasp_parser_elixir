defmodule RaspParser do
    def main(argv \\ []) do
      process
      System.halt(0)
    end

    def process do
        RaspParser.FileOperations.read_cities |> IO.puts
    end
end
