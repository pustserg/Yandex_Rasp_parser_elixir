defmodule RaspParser.Parsers do
  @moduledoc false

  def parse_city(url) do
    {:ok, response} = HTTPoison.get(url)
    Floki.find(response.body, ".directions-menu__link")
      |> Enum.map(&parse_direction_page/1)
  end

  def parse_direction(direction) do
    {:ok, response} = HTTPoison.get(RaspParser.Models.Direction.url(direction))
    Floki.find(response.body, ".b-scheme__station a")
      |> Enum.map(&parse_station_page(&1, direction.name))
  end

  defp parse_direction_page(url) do
    {_, options, [name]} = url
    [_, {"href", href}, _] = options
    %RaspParser.Models.Direction{name: name, href: href}
  end

  defp parse_station_page(url, direction_name) do
    {_, options, [name]} = url
    [_, {"href", href}] = options
    [_, _, code] = hd(String.split(href, "?")) |> String.split("/")
    %RaspParser.Models.Station{
      name: name, direction_name: direction_name, code: code}
  end
end