defmodule CovidHotspot do
  @moduledoc false

  alias CovidHotspot.TestCovidData
  alias CovidHotspot.PopulationData
  alias CovidHotspot.Collate

  def generate_covid_hotspot_data do
    get_covid_data()
    |> Map.get("areas")
    |> Enum.reject(fn area ->
      Collate.covid_id_to_population_id(area["id"]) == nil
    end)
    |> Enum.map(fn
      area ->
        %{
          "id" => id,
          "displayName" => display_name,
          "totalConfirmed" => total_confirmed,
          "totalDeaths" => total_deaths,
          "totalRecovered" => total_recovered
        } = normalize_covid_area(area)

        active_cases = total_confirmed - total_deaths - total_recovered
        population = get_population(id)
        fraction = Float.round(active_cases / population, 5)

        %{
          id: id,
          display_name: display_name,
          active_cases: active_cases,
          population: population,
          fraction: fraction
        }
    end)
    |> Enum.reject(fn %{fraction: fraction} -> fraction == 0.0 end)
    |> Enum.sort(fn %{fraction: fraction1}, %{fraction: fraction2} ->
      fraction1 >= fraction2
    end)
  end

  defp normalize_covid_area(%{"totalConfirmed" => total} = area) when is_nil(total),
    do: normalize_covid_area(%{area | "totalConfirmed" => 0})

  defp normalize_covid_area(%{"totalDeaths" => total} = area) when is_nil(total),
    do: normalize_covid_area(%{area | "totalDeaths" => 0})

  defp normalize_covid_area(%{"totalRecovered" => total} = area) when is_nil(total),
    do: normalize_covid_area(%{area | "totalRecovered" => 0})

  defp normalize_covid_area(%{} = area), do: area

  defp get_population(covid_id) do
    IO.inspect(covid_id)
    population_id = Collate.covid_id_to_population_id(covid_id)
    # TODO make this more efficient by making PopulationData a dictionary
    %{"population" => population} =
      Enum.find(PopulationData.get_data(), fn %{"country_code" => country_code} ->
        country_code == population_id
      end)

    population
  end

  defp get_covid_data do
    TestCovidData.get_data()
  end
end
