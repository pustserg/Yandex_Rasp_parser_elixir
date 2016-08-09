defmodule RaspParser.Models.City do
  @moduledoc false

  defstruct name: "", code: ""

  def url(city) do
    "#{Application.get_env(:rasp_parser, :base_rasp_url)}/city/#{city.code}"
  end
end