defmodule CovidHotspot.BingCovidData do
  @cache_seconds 60 * 60
  def get_data() do
    with [{:bing_covid_data, {data, expiry}}] <- :ets.lookup(:cache, :bing_covid_data),
         true <- DateTime.diff(DateTime.utc_now(), expiry) < @cache_seconds do
      data
    else
      _ ->
        fetch_fresh_data()
    end
  end

  defp fetch_fresh_data() do
    %HTTPoison.Response{status_code: 200, body: body} =
      HTTPoison.get!("https://bing.com/covid/data")

    fresh_data = Jason.decode!(body)
    :ets.insert(:cache, {:bing_covid_data, {fresh_data, DateTime.utc_now()}})
    fresh_data
  end
end
