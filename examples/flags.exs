union_jack = """
RRR    BBBBBBBBBB  RR  BBBBBBBBBB    RRR-
  RR     BBBBBBBB  RR  BBBBBBBB     RR  -
B   RR     BBBBBB  RR  BBBBBB     RR   B-
BBB   RR     BBBB  RR  BBBB     RR   BBB-
BBBBB   RR    BBB  RR  BBB    RR   BBBBB-
                   RR                   -
RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR-
                   RR                   -
BBBBB   RR    BBB  RR  BBB    RR   BBBBB-
BBB   RR     BBBB  RR  BBBB     RR   BBB-
B   RR     BBBBBB  RR  BBBBBB     RR   B-
  RR     BBBBBBBB  RR  BBBBBBBB     RR  -
RRR    BBBBBBBBBB  RR  BBBBBBBBBB    RRR-
"""

old_glory = """
|* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
| * * * * * * * * *  :::::::::::::::::::::::::|
|* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
| * * * * * * * * *  :::::::::::::::::::::::::|
|* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
| * * * * * * * * *  :::::::::::::::::::::::::|
|* * * * * * * * * * OOOOOOOOOOOOOOOOOOOOOOOOO|
|:::::::::::::::::::::::::::::::::::::::::::::|
|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
|:::::::::::::::::::::::::::::::::::::::::::::|
|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
|:::::::::::::::::::::::::::::::::::::::::::::|
|OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO|
"""

print_union_jack = fn char->
  case char do
    "R" -> IO.write Palette.Style.bg " ", "#c9120a"
    "B" -> IO.write Palette.Style.bg " ", "#10116d"
    " " -> IO.write Palette.Style.bg " ", "#FFFFFF"
    "\n" -> IO.write "\n"
     _ -> nil
  end
end
union_jack |> String.split("") |> Enum.each(&(print_union_jack.(&1)))

print_old_glory = fn char->
  case char do
    "O" -> IO.write Palette.Style.bg " ", "#c9120a"
    ":" -> IO.write Palette.Style.bg " ", "FFFFFF"
    " " -> IO.write Palette.Style.bg " ", "#10116d"
    "*" -> IO.write Palette.Style.bg "*", "#10116d"
    "\n" -> IO.write "\n"
     _ -> nil
  end
end
old_glory |> String.split("") |> Enum.each(&(print_old_glory.(&1)))