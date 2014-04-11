defmodule Palette.ExtendedColor do
  @moduledoc false
  def foreground(rgb, content) do
    "\e[38;5;" <> "#{code(rgb)}m" <> content <> postfix
  end

  def background(rgb, content) do
    "\e[48;5;" <> "#{code(rgb)}m" <> content <> postfix
  end

  defp postfix do
    "\033[0m"
  end

  defp code(rgb) do
    rgb |> Palette.RGB.closest_color |> Palette.Color.Palette.color_code
  end
end
