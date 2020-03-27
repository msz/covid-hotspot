defmodule CovidHotspot.PopulationData do
  @data "lib/covid_hotspot/population_data.json"
        |> File.read!()
        |> Jason.decode!()

  def get_data do
    @data
  end
end
