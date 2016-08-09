defmodule RaspParser.Parsers do
  @moduledoc false

  def parse_city(url) do
    {:ok, response} = HTTPoison.get(url)
    Floki.find(response.body, ".directions-menu__link")
      |> Enum.map(&parse_link/1)
  end

  defp parse_link(link) do
    {_, options, name_arr} = link
    name = hd name_arr
    [_, {"href", href}, _] = options
    %RaspParser.Models.Direction{name: name, href: href}
  end
end