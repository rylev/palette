defmodule Palette.Color.Palette do
  colors = [
    # ANSI colours (the first 16) are configurable by users in most
    # terminals.
    #
    # The colour values in comments are the defaults for xterm.
    nil, # [0, 0, 0]
    nil, # [205, 0, 0]
    nil, # [0, 205, 0]
    nil, # [205, 205, 0]
    nil, # [0, 0, 238]
    nil, # [205, 0, 205]
    nil, # [0, 205, 205]
    nil, # [229, 229, 229]
    nil, # [127, 127, 127]
    nil, # [255, 0, 0]
    nil, # [0, 255, 0]
    nil, # [255, 255, 0]
    nil, # [92, 92, 255]
    nil, # [255, 0, 255]
    nil, # [0, 255, 255]
    nil, # [255, 255, 255]

    # The colours bellow are the definitions from xterm extended
    # colour palette. They should be the same across terminals.
    [0, 0, 0],
    [0, 0, 95],
    [0, 0, 135],
    [0, 0, 175],
    [0, 0, 215],
    [0, 0, 255],
    [0, 95, 0],
    [0, 95, 95],
    [0, 95, 135],
    [0, 95, 175],
    [0, 95, 215],
    [0, 95, 255],
    [0, 135, 0],
    [0, 135, 95],
    [0, 135, 135],
    [0, 135, 175],
    [0, 135, 215],
    [0, 135, 255],
    [0, 175, 0],
    [0, 175, 95],
    [0, 175, 135],
    [0, 175, 175],
    [0, 175, 215],
    [0, 175, 255],
    [0, 215, 0],
    [0, 215, 95],
    [0, 215, 135],
    [0, 215, 175],
    [0, 215, 215],
    [0, 215, 255],
    [0, 255, 0],
    [0, 255, 95],
    [0, 255, 135],
    [0, 255, 175],
    [0, 255, 215],
    [0, 255, 255],
    [95, 0, 0],
    [95, 0, 95],
    [95, 0, 135],
    [95, 0, 175],
    [95, 0, 215],
    [95, 0, 255],
    [95, 95, 0],
    [95, 95, 95],
    [95, 95, 135],
    [95, 95, 175],
    [95, 95, 215],
    [95, 95, 255],
    [95, 135, 0],
    [95, 135, 95],
    [95, 135, 135],
    [95, 135, 175],
    [95, 135, 215],
    [95, 135, 255],
    [95, 175, 0],
    [95, 175, 95],
    [95, 175, 135],
    [95, 175, 175],
    [95, 175, 215],
    [95, 175, 255],
    [95, 215, 0],
    [95, 215, 95],
    [95, 215, 135],
    [95, 215, 175],
    [95, 215, 215],
    [95, 215, 255],
    [95, 255, 0],
    [95, 255, 95],
    [95, 255, 135],
    [95, 255, 175],
    [95, 255, 215],
    [95, 255, 255],
    [135, 0, 0],
    [135, 0, 95],
    [135, 0, 135],
    [135, 0, 175],
    [135, 0, 215],
    [135, 0, 255],
    [135, 95, 0],
    [135, 95, 95],
    [135, 95, 135],
    [135, 95, 175],
    [135, 95, 215],
    [135, 95, 255],
    [135, 135, 0],
    [135, 135, 95],
    [135, 135, 135],
    [135, 135, 175],
    [135, 135, 215],
    [135, 135, 255],
    [135, 175, 0],
    [135, 175, 95],
    [135, 175, 135],
    [135, 175, 175],
    [135, 175, 215],
    [135, 175, 255],
    [135, 215, 0],
    [135, 215, 95],
    [135, 215, 135],
    [135, 215, 175],
    [135, 215, 215],
    [135, 215, 255],
    [135, 255, 0],
    [135, 255, 95],
    [135, 255, 135],
    [135, 255, 175],
    [135, 255, 215],
    [135, 255, 255],
    [175, 0, 0],
    [175, 0, 95],
    [175, 0, 135],
    [175, 0, 175],
    [175, 0, 215],
    [175, 0, 255],
    [175, 95, 0],
    [175, 95, 95],
    [175, 95, 135],
    [175, 95, 175],
    [175, 95, 215],
    [175, 95, 255],
    [175, 135, 0],
    [175, 135, 95],
    [175, 135, 135],
    [175, 135, 175],
    [175, 135, 215],
    [175, 135, 255],
    [175, 175, 0],
    [175, 175, 95],
    [175, 175, 135],
    [175, 175, 175],
    [175, 175, 215],
    [175, 175, 255],
    [175, 215, 0],
    [175, 215, 95],
    [175, 215, 135],
    [175, 215, 175],
    [175, 215, 215],
    [175, 215, 255],
    [175, 255, 0],
    [175, 255, 95],
    [175, 255, 135],
    [175, 255, 175],
    [175, 255, 215],
    [175, 255, 255],
    [215, 0, 0],
    [215, 0, 95],
    [215, 0, 135],
    [215, 0, 175],
    [215, 0, 215],
    [215, 0, 255],
    [215, 95, 0],
    [215, 95, 95],
    [215, 95, 135],
    [215, 95, 175],
    [215, 95, 215],
    [215, 95, 255],
    [215, 135, 0],
    [215, 135, 95],
    [215, 135, 135],
    [215, 135, 175],
    [215, 135, 215],
    [215, 135, 255],
    [215, 175, 0],
    [215, 175, 95],
    [215, 175, 135],
    [215, 175, 175],
    [215, 175, 215],
    [215, 175, 255],
    [215, 215, 0],
    [215, 215, 95],
    [215, 215, 135],
    [215, 215, 175],
    [215, 215, 215],
    [215, 215, 255],
    [215, 255, 0],
    [215, 255, 95],
    [215, 255, 135],
    [215, 255, 175],
    [215, 255, 215],
    [215, 255, 255],
    [255, 0, 0],
    [255, 0, 95],
    [255, 0, 135],
    [255, 0, 175],
    [255, 0, 215],
    [255, 0, 255],
    [255, 95, 0],
    [255, 95, 95],
    [255, 95, 135],
    [255, 95, 175],
    [255, 95, 215],
    [255, 95, 255],
    [255, 135, 0],
    [255, 135, 95],
    [255, 135, 135],
    [255, 135, 175],
    [255, 135, 215],
    [255, 135, 255],
    [255, 175, 0],
    [255, 175, 95],
    [255, 175, 135],
    [255, 175, 175],
    [255, 175, 215],
    [255, 175, 255],
    [255, 215, 0],
    [255, 215, 95],
    [255, 215, 135],
    [255, 215, 175],
    [255, 215, 215],
    [255, 215, 255],
    [255, 255, 0],
    [255, 255, 95],
    [255, 255, 135],
    [255, 255, 175],
    [255, 255, 215],
    [255, 255, 255],
    [8, 8, 8],
    [18, 18, 18],
    [28, 28, 28],
    [38, 38, 38],
    [48, 48, 48],
    [58, 58, 58],
    [68, 68, 68],
    [78, 78, 78],
    [88, 88, 88],
    [98, 98, 98],
    [108, 108, 108],
    [118, 118, 118],
    [128, 128, 128],
    [138, 138, 138],
    [148, 148, 148],
    [158, 158, 158],
    [168, 168, 168],
    [178, 178, 178],
    [188, 188, 188],
    [198, 198, 198],
    [208, 208, 208],
    [218, 218, 218],
    [228, 228, 228],
    [238, 238, 238]
  ]

  Enum.map colors, fn rgb ->
    def closest(unquote(rgb)), do: unquote(rgb)
  end

  defp colors, do: unquote(colors)

  def display do
      IO.inspect(block_width)
      IO.inspect(number_of_columns)
      IO.inspect(div(block_width, number_of_columns))
    colors |>
      Enum.filter(fn color -> color != nil end) |>
      Enum.chunk(div(number_of_columns, block_width)) |>
      Enum.map(&each_chunk/1) |>
      Enum.join("\n")
  end

  def closest(rgb) do
    case Palette.Color.Cache.get(rgb) do
      nil ->
        closest = Palette.Color.Distance.closest(rgb, Enum.filter(colors, &(&1 != nil)))
        Palette.Color.Cache.update(Map.new([{rgb, closest}]))
        closest
      closest_color -> closest_color
    end
  end

  def color_code(rgb) do
    Enum.find_index(colors, fn color -> color == rgb end)
  end

  defp each_chunk(colors_in_chunk) do
    background_row = background_row(colors_in_chunk)
    [ background_row,
      background_row,
      info_row(colors_in_chunk),
      background_row,
      background_row
    ] |> Enum.intersperse("\n") |> Enum.join
  end

  defp background_row(colors_in_row) do
    colors_in_row |>
      Enum.map(&(background(&1))) |>
      Enum.join
  end

  defp info_row(colors_in_row) do
    colors_in_row |>
      Enum.map(&(write(&1))) |>
      Enum.join
  end

  defp background(color) do
    Palette.bg String.duplicate(" ", block_width), color
  end

  defp write(color) do
    font_color = Palette.Color.Distance.furthest(color, [Palette.RGB.white, Palette.RGB.black])
    Palette.color "    #{Palette.RGB.encode(color)}    ", color, font_color
  end

  def number_of_columns do
    {:ok, num_cols } = :io.columns
    num_cols
  end

  def block_width do
    15
  end
end

defmodule Palette.Color.Cache do
  @moduledoc false
  use GenServer.Behaviour

  def start_link do
    :gen_server.start_link({ :local, __MODULE__ }, __MODULE__, :ok, [])
  end

  def update(new_color = %{}) do
    :gen_server.cast(__MODULE__, { :update, new_color })
  end

  def get(color) when is_list color do
    :gen_server.call(__MODULE__, { :get, color })
  end

  ## Callbacks

  def init(:ok) do
    { :ok, Map.new }
  end

  def handle_call({ :get, color }, _from, cache) do
    closest = case Map.fetch(cache, color) do
      { :ok, c } -> c
      :error -> nil
    end
    { :reply, closest, cache }
  end

  def handle_cast({ :update, new_color }, cache) do
    { :noreply, Map.merge(new_color, cache) }
  end
end
