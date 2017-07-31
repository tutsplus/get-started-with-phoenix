defmodule BandManagerWeb.BandController do
  use BandManagerWeb, :controller

  alias BandManager.Artists

  def index(conn, %{"query" => search} = params) do
    bands = Artists.find_bands(search)

    conn
    |> put_flash(:search, "Found #{Enum.count(bands)} band(s) matching your search.")
    |> render("index.html", bands: bands)
  end

  def index(conn, _params) do
    render conn, "index.html", bands: Artists.list_bands()
  end

  def show(conn, %{"id" => id}) do
    render conn, "show.html", band: Artists.get_band!(id)
  end
end
