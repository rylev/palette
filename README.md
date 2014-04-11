# Palette

Palette makes rendering colors in the terminal easy. This library is heavily
influenced by the Ruby gem [tco](https://github.com/pazdera/tco).

## Usage

Instead of worrying about which colors and styles your terminal is capable of
rendering, Palette allows you to write code as if your terminal supported any
color of the rainbow. Palette will automagically select the color closest to
the color you've asked for.

```elixir
iex> Palette.color("This is my string.", "#F60045", "#9967FD")
"\e[38;5;99m\e[48;5;197mThis is my string\e[0m\e[0m"
iex> Palette.fg("This is my string.", "red")
"\e[38;5;196mThis is my string.\e[0m"
```

Palette allows any styles to be composed:

```elixir
iex> my_string = "This is my string."
"This is my string."
iex> my_string |> Palette.bg("#F60045") |> Palette.bright |> Palette.fg("#9967FD")
"\e[38;5;99m\e[1m\e[48;5;197mThis is my string.\e[0m\e[0m\e[0m"
```

To see the full range of colors that your terminal supports simply run:

```elixir
iex> Palette.display
```

## Examples

Here's an example of Palette rendering a Rainbow inside your terminal:

```elixir
rainbow = ["#622e90", "#2d3091", "#00aaea", "#02a552", "#fdea22", "#eb443b", "#f37f5a"]
Enum.each (0..10), fn _ ->
  Enum.each rainbow, fn color -> Palette.bg("    ", color) |> IO.write end
  IO.puts ""
end
```

To see more of Palette in action run an example script with mix. For example:

`mix run examples/flags.exs`

## Contributing

1. Fork it.
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

## Thanks

A big thanks to [Radek Pazdera](https://github.com/pazdera) for [tco](https://github.com/pazdera/tco)
which was the inspiration for Palette.
