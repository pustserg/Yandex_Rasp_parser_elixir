defmodule RaspParser.Models.Direction do
  @moduledoc false

  defstruct name: "", href: ""

  def url(direction) do
    "#{Application.get_env(:rasp_parser, :base_rasp_url)}/#{direction.href}"
  end
end