defmodule RaspParser.Models.Station do
  @moduledoc false

  defstruct name: "", direction_name: "", code: ""

  defimpl RaspParser.Stringable, for: RaspParser.Models.Station do
    def to_string(station = %RaspParser.Models.Station{}) do
      "#{station.name};#{station.direction_name};#{station.code}"
    end
  end
end