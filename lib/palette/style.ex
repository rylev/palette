defmodule Palette.Style do
  def color(string, fg, bg) do
    string |> fg(fg) |> bg(bg)
  end

  def fg(string, color) do
    process string, &(foreground(&1, color))
  end

  def bg(string, color) do
    process string, &(background(&1, color))
  end

  def bright(string) do
    process string, &(IO.ANSI.escape "%{bright}#{&1}")
  end
  def bold(string), do: bright(string)

  def underline(string) do
    process string, &(IO.ANSI.escape "%{underline}#{&1}")
  end

  defp background(content, rgb) do
    background("#{ansi_code(rgb)}m" <> content)
  end
  defp foreground(content, rgb) do
    foreground("#{ansi_code(rgb)}m" <> content)
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

  defp ansi_code(rgb) do
    rgb |> RGB.closest_color |> Palette.Color.Palette.ansi_code
  end

  defp process(string, process_fun) do
    String.split(string, "\n") |> Enum.filter(&(&1 != "")) |> Enum.map(process_fun) |> Enum.join("\n")
  end
end
