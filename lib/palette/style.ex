defmodule Palette.Style do
  def fg(string, color) do
    process string, &(foreground(&1, color))
  end

  def bg(string, color) do
    process string, &(background(&1, color))
  end

  def bright(string) do
    process string, &(IO.ANSI.escape "%{bright}#{&1}")
  end

  def underline(string) do
    process string, &(IO.ANSI.escape "%{underline}#{&1}")
  end

  defp background(content, rgb) do
    background("#{color_approximation(rgb)}m" <> content)
  end
  defp foreground(content, rgb) do
    foreground("#{color_approximation(rgb)}m" <> content)
  end

  defp foreground(content) do
    "\e[38;5;" <> content <> postfix
  end

  defp background(content) do
    "\e[48;5;" <> content <> postfix
  end

  defp postfix do
    "\033[0m"
  end

  defp process(string, process_fun) do
    String.split(string, "\n") |> Enum.filter(&(&1 != "")) |> Enum.map(process_fun) |> Enum.join("\n")
  end

  defp color_approximation(rgb_string) do
    rgb_string |> parse_rgb |> Palette.ColorPalette.closest_color |> Palette.ColorPalette.color_code
  end

  defp parse_rgb(rgb_string) when is_binary rgb_string do
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
