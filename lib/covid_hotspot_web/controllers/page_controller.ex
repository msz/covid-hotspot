defmodule CovidHotspotWeb.PageController do
  use CovidHotspotWeb, :controller

  def index(conn, _params) do
    [top | _] = ranking = CovidHotspot.generate_covid_hotspot_data()
    render(conn, "index.html", top: top, ranking: ranking)
  end
end
