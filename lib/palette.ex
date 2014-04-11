defmodule Palette do
  use Application.Behaviour
  @moduledoc """
    Format strings with various different styles and colors. The actual color rendered
    to the terminal is approximated from the given color.

    Possible color formats include:

    * RGB values: '#00FF00', '0x00FF00', '00FF00', [0, 255, 0]
    * English names: "red", "black", "yellow", etc.
  """

  @doc """
    Start the palette application
  """
  def start(_type, _args) do
    Palette.Color.Cache.start_link
  end

  @doc """
    Add background and foreground colors to a string
     ## Examples

     iex> Palette.color("Hello, World!", "#3F739A", "#4F2B99")
        "\e[38;5;55m\e[48;5;25mHello, World!\e[0m\e[0m"
  """
  def color(string, bg, fg) do
    string |> bg(bg) |> fg(fg)
  end

  Palette.RGB.colors_map |> Enum.each fn {color, rgb} ->
    color_name = atom_to_binary(color)
    def fg(string, unquote(color_name)) do
      fg(string, unquote(rgb))
    end

    def bg(string, unquote(color_name)) do
      bg(string, unquote(rgb))
    end
  end

  @doc """
    Add a background color to a string
     ## Examples

     iex> Palette.bg("Hello, World!", "#3F739A")
        "e[48;5;25mHello, World!\e[0m"
  """
  def bg(string, color) do
    process string, &(background(&1, color))
  end

  @doc """
    Add foreground color to a string
     ## Examples

     iex> Palette.fg("Hello, World!", "#3F739A")
        "\e[38;5;25mHello, World!\e[0m"
  """
  def fg(string, color) do
    process string, &(foreground(&1, color))
  end

  @doc """
    Brighten the foreground of a string. Alias of `Palette.bold`.
     ## Examples

     iex> Palette.bright("Hello, World!")
        "\e[1mHello, World!\e[0m"
  """
  def bright(string) do
    process string, &(IO.ANSI.escape "%{bright}#{&1}")
  end

  @doc """
    Brighten the foreground of a string. Alias of `Palette.bright`.
     ## Examples

     iex> Palette.bright("Hello, World!")
        "\e[1mHello, World!\e[0m"
  """
  def bold(string), do: bright(string)

  @doc """
    Underline a string.
     ## Examples

     iex> Palette.underline("Hello, World!")
        "\e[4mHello, World!\e[0m"
  """
  def underline(string) do
    process string, &(IO.ANSI.escape "%{underline}#{&1}")
  end

  @doc """
    Inverse the foreground and background colors of a string.
     ## Examples

     iex> Palette.inverse("Hello, World!")
        "\e[7mHello, World!\e[0m"
  """
  def inverse(string) do
    process string, &(IO.ANSI.escape "%{inverse}#{&1}")
  end

  defp background(content, rgb) do
    Palette.Ansi.background(rgb, content)
  end

  defp foreground(content, rgb) do
    Palette.Ansi.foreground(rgb, content)
  end

  defp process(string, process_fun) do
    String.split(string, "\n") |> Enum.filter(&(&1 != "")) |> Enum.map(process_fun) |> Enum.join("\n")
  end
end
