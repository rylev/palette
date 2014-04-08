defmodule Palette.RGB do
  import Enum, only: [map: 2, join: 1, filter: 2, chunk: 2, count: 1]
  colors = %{
    black: [0, 0, 0],
    white: [255, 255, 255],
    red: [255, 0, 0],
    blue: [0, 0, 255],
    green: [0, 95, 0],
    # yellow: [255, 255, 0],
    purple: [95, 0, 95],
    grey: [80, 80, 80]
  }

  Enum.map colors, fn { name, rgb } ->
    def unquote(name)(), do: unquote(rgb)
  end

  def closest_color(rgb_string) when is_binary rgb_string do
    rgb_string |> parse |> Palette.Color.Palette.closest
  end
  def closest_color(rgb_list) when is_list rgb_list do
    rgb_list |> Palette.Color.Palette.closest
  end

  def encode(rgb) do
    hex = rgb |>
      map(&(integer_to_list &1, 16)) |>
      map(fn [x] -> [x, x]; x  -> x end) |>
      map(&String.from_char_list!/1) |>
      join
    "#" <> hex
  end

  def parse(rgb_string) when is_binary rgb_string do
    unless valid_rgb_string?(rgb_string) do
      raise "#{rgb_string} is not a valid rgb color"
    end

    rgb_string |>
      rgb_hex |>
      String.split("") |>
      filter(&(&1 != "")) |>
      fn list -> chunk(list, div(count(list), 3)) end.() |>
      map(&join/1) |>
      map(&(binary_to_integer &1, 16))
  end

  defp valid_rgb_string?(rgb_string) do
    valid_rgb_format?(rgb_string) && valid_rgb_length?(rgb_string)
  end

  defp rgb_hex("#" <> rest), do: rest
  defp rgb_hex("0x" <> rest), do: rest
  defp rgb_hex(full), do: full

  defp valid_rgb_length?(rgb_string) do
    hex = rgb_hex rgb_string
    String.length(hex) == 6 || String.length(hex) == 3
  end

  defp valid_rgb_format?(rgb_string) do
    rgb_regexp = ~r/^(0x|#)?([0-9a-fA-F][0-9a-fA-F]?){3}$/
    String.match? rgb_string, rgb_regexp
  end
end
