defmodule BandManagerWeb.AlbumController do
  use BandManagerWeb, :controller

  alias BandManager.Artists

  def new(conn, %{"band_id" => band_id}) do
    band = Artists.get_band!(band_id)
    changeset = Artists.change_album(%Artists.Album{})

    render(conn, "new.html", band: band, changeset: changeset)
  end

  def create(conn, %{"band_id" => band_id, "album" => album_params}) do
    band = Artists.get_band!(band_id)

    case Artists.create_album_with_songs(band, album_params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "The album was created")
        |> redirect(to: band_path(conn, :show, band))
      {:error, :album, changeset} ->
        render(conn, "new.html", band: band, changeset: changeset)
      {:error, :song} ->
        render(conn, "new.html", band: band, changeset: Artists.Album.changeset(%Artists.Album{}, album_params))
    end
  end
end
