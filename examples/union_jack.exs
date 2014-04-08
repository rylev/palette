flag = """
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

print = fn char->
  case char do
    "R" -> IO.write Palette.Style.bg " ", "#c9120a"
    "B" -> IO.write Palette.Style.bg " ", "#10116d"
    " " -> IO.write Palette.Style.bg " ", "#ffffff"
    "\n" -> IO.write "\n"
     _ -> nil
  end
end
flag |> String.split("") |> Enum.each(&(print.(&1)))