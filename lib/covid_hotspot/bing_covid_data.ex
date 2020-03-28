defmodule CovidHotspot.BingCovidData do
  def get_data() do
    %HTTPoison.Response{status_code: 200, body: body} =
      HTTPoison.get!("https://bing.com/covid/data")

    Jason.decode!(body)
  end
end
