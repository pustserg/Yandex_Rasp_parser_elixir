defmodule RaspParser.Models.Direction do
  @moduledoc false

  defstruct name: "", href: ""

  def url(direction) do
    "#{Application.get_env(:rasp_parser, :base_rasp_url)}/#{direction.href}"
  end

  defimpl RaspParser.Stringable, for: RaspParser.Models.Direction do
    def to_string(direction) do
      "#{direction.name};#{RaspParser.Models.Direction.url(direction)})"
    end
  end
end