rainbow = ["#622e90", "#2d3091", "#00aaea", "#02a552", "#fdea22", "#eb443b", "#f37f5a"]
Enum.each (0..10), fn _ ->
  Enum.each rainbow, fn color -> Palette.bg("    ", color) |> IO.write end
  IO.puts ""
end