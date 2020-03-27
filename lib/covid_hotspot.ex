defmodule CovidHotspot do
  @moduledoc false

  alias CovidHotspot.TestCovidData
  alias CovidHotspot.PopulationData

  @covid_id_to_population_id %{
    "unitedstates" => "USA",
    "chinamainland" => "CHN",
    "italy" => "ITA"
  }

  def generate_covid_hotspot_data do
    get_covid_data()
    |> Map.get("areas")
    |> Enum.reject(fn area ->
      covid_id_to_population_id(area["id"]) == nil
    end)
    |> Enum.map(fn area ->
      %{
        "id" => id,
        "displayName" => display_name,
        "totalConfirmed" => total_confirmed,
        "totalDeaths" => total_deaths,
        "totalRecovered" => total_recovered
      } = area

      active_cases = total_confirmed - total_deaths - total_recovered

      %{
        id: id,
        display_name: display_name,
        active_cases: active_cases,
        population: get_population(id)
      }
    end)
  end

  defp get_population(covid_id) do
    population_id = covid_id_to_population_id(covid_id)

    %{"population" => population} =
      # TODO make this more efficient by making PopulationData a dictionary
      Enum.find(PopulationData.get_data(), fn %{"country_code" => country_code} ->
        country_code == population_id
      end)

    population
  end

  defp covid_id_to_population_id(covid_id) do
    @covid_id_to_population_id[covid_id]
  end

  defp get_covid_data do
    TestCovidData.get_data()
  end
end
