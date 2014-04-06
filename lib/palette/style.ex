defmodule Palette.Style do
  def bright(string) do
    process string, &(IO.ANSI.escape "%{bright}#{&1}")
  end

  def underline(string) do
    process string, &(IO.ANSI.escape "%{underline}#{&1}")
  end

  defp process(string, process_fun) do
    String.split(string, "\n") |> Enum.filter(&(&1 != "")) |> Enum.map(process_fun) |> Enum.join("\n")
  end
end
