defmodule BandManagerWeb.BandControllerTest do
  use BandManagerWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Bands"
  end

  test "GET /:band", %{conn: conn} do
    {:ok, band} = BandManager.Artists.create_band(%{name: "Test Band", genre: "Pop"})

    conn = get conn, "/" <> band.id
    assert html_response(conn, 200) =~ "Test Band"
  end
end
