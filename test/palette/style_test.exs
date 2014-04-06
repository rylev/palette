defmodule StyleTest do
  use ExUnit.Case

  defp string  do
    """
    This is the first line.
    And this is the second.
    """
  end

  test "fg/2 colors the foreground of each line of the passed in string" do
    assert Palette.Style.fg(string, "#ff0000") == "\e[38;5;196mThis is the first line.\e[0m\n\e[38;5;196mAnd this is the second.\e[0m"
    assert Palette.Style.fg(string, "#2d3091") == "\e[38;5;19mThis is the first line.\e[0m\n\e[38;5;19mAnd this is the second.\e[0m"
  end

  test "bright/1 brightens each line of the passed in string" do
    assert Palette.Style.bright(string) == "\e[1mThis is the first line.\e[0m\n\e[1mAnd this is the second.\e[0m"
  end

  test "underline/1 underlines each line of the passed in string" do
    assert Palette.Style.underline(string) == "\e[4mThis is the first line.\e[0m\n\e[4mAnd this is the second.\e[0m"
  end
end
