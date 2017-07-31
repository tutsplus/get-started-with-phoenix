defmodule BandManagerWeb.RatingChannel do
  use BandManagerWeb, :channel

  alias BandManager.Artists

  def join("rating:" <> _band, payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  def handle_in("rating:add", payload, socket) do
    song = Artists.get_song!(payload["song"])
    BandManager.Ratings.add_rating(song, %{value: payload["rating"]})

    broadcast socket, "rating:changed", %{song: song.id, rating: Artists.average_song_rating(song)}
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
