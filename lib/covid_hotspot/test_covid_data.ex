defmodule CovidHotspot.TestCovidData do
  @data "lib/covid_hotspot/test_covid_data.json"
        |> File.read!()
        |> Jason.decode!()

  def get_data do
    @data
  end
end
