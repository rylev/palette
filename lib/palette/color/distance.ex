defmodule Palette.Color.Distance do
  def calculate(color1, color2) do
    delta_e_2000 rgb_to_lab(color1), rgb_to_lab(color2)
  end

  def closest(color, comparison_colors) when is_list comparison_colors do
    [[closest,_]|_] = compare_colors(color, comparison_colors, fn d1, d2 -> d1 < d2 end)
    closest
  end

  def furthest(color, comparison_colors) when is_list comparison_colors do
    [[furthest,_]|_] = compare_colors(color, comparison_colors, fn d1, d2 -> d1 > d2 end)
    furthest
  end

  defp compare_colors(color, comparison_colors, compare_fun) do
    comparison_colors |>
      Enum.map(&([&1, abs(calculate(color, &1))])) |>
      Enum.sort(fn ([_,d1], [_,d2]) -> compare_fun.(d1, d2) end)
  end

  # http://www.easyrgb.com/index.php?X=MATH&H=02#text2
  defp rgb_to_xyz(rgb) do
    [r, g, b] = Enum.map rgb, fn v ->
      v = v / 255
      if v > 0.04045 do
          v = :math.pow ((v + 0.055 ) / 1.055), 2.4
      else
          v = v / 12.92
      end
      v * 100
    end

    #Observer = 2°, Illuminant = D65
    x = r * 0.4124 + g * 0.3576 + b * 0.1805
    y = r * 0.2126 + g * 0.7152 + b * 0.0722
    z = r * 0.0193 + g * 0.1192 + b * 0.9505

    [x, y, z]
  end

  defp rgb_to_lab(rgb) do
    rgb |> rgb_to_xyz |> xyz_to_lab
  end

  # https://github.com/pazdera/tco/blob/master/lib/tco/palette.rb#L95
  defp xyz_to_lab([x,y,z]) do
    f = fn t ->
      if t > :math.pow (6/29), 3 do
        :math.pow t, 1/3
      else
        (1/3) * (:math.pow 29/6, 2) * t + (4/29)
      end
    end
    [xn, yn, zn] = rgb_to_xyz [255, 255, 255]
    l = 116 * f.(y/yn) - 16
    a = 500 * (f.(x/xn) - f.(y/yn))
    b = 200 * (f.(y/yn) - f.(z/zn))

    [l, a, b]
  end

  defp cie_lab_2_hue(a, b) do
    cond do
      (a >= 0 && b == 0) -> 0
      (a <  0 && b == 0) -> 180
      (a == 0 && b > 0) -> 90
      (a == 0 && b < 0) -> 270
      true ->
        bias = cond do
          a > 0 && b > 0 -> 0
          a < 0 -> 180
          a > 0 && b < 0 -> 360
        end
        rad_to_deg(:math.atan(b/a)) + bias
    end
  end

  defp delta_e_2000([l1, a1, b1], [l2, a2, b2]) do
    [kl, kc, kh] = [1, 1, 1]

    xC1 = :math.sqrt(:math.pow(a1, 2) + :math.pow(b1, 2))
    xC2 = :math.sqrt(:math.pow(a2, 2) + :math.pow(b2, 2))
    xCX = (xC1 + xC2) / 2
    xGX = 0.5 * (1 - :math.sqrt((:math.pow(xCX, 7)) / ((:math.pow xCX, 7) + (:math.pow(25, 7)))))
    xNN = (1 + xGX) * a1
    xC1 = :math.sqrt((:math.pow xNN, 2) + (:math.pow b1, 2))
    xH1 = cie_lab_2_hue(xNN, b1)
    xNN = (1 + xGX) * a2
    xC2 = :math.sqrt((:math.pow(xNN, 2)) + (:math.pow(b2, 2)))
    xH2 = cie_lab_2_hue(xNN, b2)
    xDL = l2 - l1
    xDC = xC2 - xC1
    if (xC1 * xC2) == 0 do
      xDH = 0
    else
      xNN = Float.round ((xH2 - xH1)/1), 12
      if abs(xNN) <= 180 do
        xDH = xH2 - xH1
      else
        if xNN > 180 do
          xDH = xH2 - xH1 - 360
        else
          xDH = xH2 - xH1 + 360
        end
      end
    end
    xDH = 2 * :math.sqrt(xC1 * xC2) * :math.sin(deg_to_rad(xDH / 2))
    xLX = (l1 + l2) / 2
    xCY = (xC1 + xC2) / 2
    if xC1 * xC2 == 0 do
      xHX = xH1 + xH2
    else
      xNN = Float.round((xH1 - xH2)/1, 12) |> abs
      if xNN > 180 do
        if xH2 + xH1 < 360 do
          xHX = xH1 + xH2 + 360
        else
          xHX = xH1 + xH2 - 360
        end
      else
        xHX = xH1 + xH2
      end
      xHX = xHX / 2
    end
    xTX = 1 - 0.17 * :math.cos(deg_to_rad(xHX - 30)) + 0.24 *
                     :math.cos(deg_to_rad(2 * xHX)) + 0.32 *
                     :math.cos(deg_to_rad(3 * xHX + 6)) - 0.20 *
                     :math.cos(deg_to_rad(4 * xHX - 63 ))
    xPH = 30 * :math.exp(-((xHX - 275) / 25) * ((xHX  - 275) / 25))
    xRC = 2 * :math.sqrt((:math.pow(xCY, 7)) / ((:math.pow(xCY, 7)) + :math.pow(25, 7)))
    xSL = 1 + ((0.015 * ((xLX - 50) * (xLX - 50))) /
          :math.sqrt(20 + ((xLX - 50) * (xLX - 50))))
    xSC = 1 + 0.045 * xCY
    xSH = 1 + 0.015 * xCY * xTX
    xRT = -:math.sin(deg_to_rad(2 * xPH)) * xRC
    xDL = xDL / (kl * xSL)
    xDC = xDC / (kc * xSC)
    xDH = xDH / (kh * xSH)
    :math.sqrt(:math.pow(xDL, 2) + :math.pow(xDC, 2) + :math.pow(xDH, 2) + xRT * xDC * xDH)
  end

  defp deg_to_rad(v) do
    (v * :math.pi) / 180
  end

  defp rad_to_deg(v) do
    (v * 180) / :math.pi
  end
end
