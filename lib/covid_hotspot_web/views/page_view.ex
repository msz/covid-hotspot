defmodule CovidHotspotWeb.PageView do
  use CovidHotspotWeb, :view

  def percent(fraction) do
    Float.round(fraction * 100, 5)
  end
end
