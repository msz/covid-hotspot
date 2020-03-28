defmodule CovidHotspotWeb.PageView do
  use CovidHotspotWeb, :view

  def million_fraction(number) do
    fraction = (number / 1_000_000)
    Float.round(fraction, 2)
  end

  def percent(fraction) do
    Float.round(fraction * 100, 5)
  end
end
