defmodule BandManagerWeb.RatingChannelTest do
  use BandManagerWeb.ChannelCase

  alias BandManagerWeb.RatingChannel
  alias BandManager.Artists

  setup do
    {:ok, _, socket} =
      socket("user_id", %{some: :assign})
      |> subscribe_and_join(RatingChannel, "rating:lobby")

    {:ok, socket: socket}
  end

  test "rating:add sends broadcast to rating:band_id", %{socket: socket} do
    {:ok, song} = Artists.create_song(%{name: "Test Song"})
    song_id = song.id

    push socket, "rating:add", %{"song" => song_id, "rating" => 3}
    assert_broadcast "rating:changed", %{song: ^song_id, rating: 3.0}
  end
end
