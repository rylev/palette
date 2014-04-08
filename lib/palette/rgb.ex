defmodule RGB do
  def closest_color(rgb_string) when is_binary rgb_string do
    rgb_string |> parse_rgb |> Palette.ColorPalette.closest
  end
  def closest_color(rgb_list) when is_list rgb_list do
    rgb_list |> Palette.ColorPalette.closest
  end

  def encode([r, g, b]) do
    "#000000"
  end

  def black do
    [00,00,00]
  end

  def white do
    [255, 255, 255]
  end

  def parse_rgb(rgb_string) when is_binary rgb_string do
    unless valid_rgb_string?(rgb_string) do
      raise "#{rgb_string} is not a valid rgb color"
    end

    rgb_string |>
    rgb_hex |>
    String.split("") |>
    Enum.filter(&(&1 != "")) |>
    fn list -> Enum.chunk(list, div(Enum.count(list), 3)) end.() |>
    Enum.map(&Enum.join/1) |>
    Enum.map(&(binary_to_integer &1, 16))
  end

  defp valid_rgb_string?(rgb_string) do
    valid_rgb_format?(rgb_string) && valid_rgb_length?(rgb_string)
  end

  defp rgb_hex(rgb_string) do
    case rgb_string do
      "#" <> rest -> rest
      "0x" <> rest -> rest
      _ -> rgb_string
    end
  end

  defp valid_rgb_length?(rgb_string) do
    hex = rgb_hex rgb_string
    String.length(hex) == 6 || String.length(hex) == 3
  end

  defp valid_rgb_format?(rgb_string) do
    rgb_regexp = ~r/^(0x|#)?([0-9a-fA-F][0-9a-fA-F]?){3}$/
    String.match? rgb_string, rgb_regexp
  end
end
