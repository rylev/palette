defmodule PaletteTest do
  use ExUnit.Case
  defp string  do
    """
    This is the first line.
    And this is the second.
    """
  end

  test "fg/2 colors the foreground of each line of the passed in string" do
    assert Palette.fg(string, "#ff0000") == "\e[38;5;196mThis is the first line.\e[0m\n\e[38;5;196mAnd this is the second.\e[0m"
    assert Palette.fg(string, "#2d3091") == "\e[38;5;19mThis is the first line.\e[0m\n\e[38;5;19mAnd this is the second.\e[0m"
  end

  test "bg/2 colors the background of each line of the passed in string" do
    assert Palette.bg(string, "#ff0000") == "\e[48;5;196mThis is the first line.\e[0m\n\e[48;5;196mAnd this is the second.\e[0m"
    assert Palette.bg(string, "#2d3091") == "\e[48;5;19mThis is the first line.\e[0m\n\e[48;5;19mAnd this is the second.\e[0m"
  end

  test "bright/1 brightens each line of the passed in string" do
    assert Palette.bright(string) == "\e[1mThis is the first line.\e[0m\n\e[1mAnd this is the second.\e[0m"
  end

  test "bold/1 boldens each line of the passed in string" do
    assert Palette.bold(string) == "\e[1mThis is the first line.\e[0m\n\e[1mAnd this is the second.\e[0m"
  end

  test "underline/1 underlines each line of the passed in string" do
    assert Palette.underline(string) == "\e[4mThis is the first line.\e[0m\n\e[4mAnd this is the second.\e[0m"
  end

  test "inverse/ inverses the background and foreground colors" do
    assert Palette.inverse(string) == "\e[7mThis is the first line.\e[0m\n\e[7mAnd this is the second.\e[0m"
  end
end
