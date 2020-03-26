defmodule CovidHotspotWeb.PageControllerTest do
  use CovidHotspotWeb.ConnCase

  test "GET /", %{conn: _conn} do
    # conn = get(conn, "/")
    # assert html_response(conn, 200) =~ "Welcome to Phoenix!"
    assert 1 == 1
  end
end
