defmodule CovidHotspotTest do
  use ExUnit.Case, async: true

  describe "generate_covid_hotspot_data/0" do
    IO.inspect(CovidHotspot.generate_covid_hotspot_data())
  end
end
