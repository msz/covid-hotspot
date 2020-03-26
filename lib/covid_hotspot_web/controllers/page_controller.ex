defmodule CovidHotspotWeb.PageController do
  use CovidHotspotWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
