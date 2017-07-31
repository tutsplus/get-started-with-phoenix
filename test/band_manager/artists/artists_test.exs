defmodule BandManager.ArtistsTest do
  use BandManager.DataCase

  alias BandManager.{Artists, Ratings}

  describe "average_song_rating/1" do
    setup do
      {:ok, song} = Artists.create_song(%{name: "Test"})
      {:ok, song: song}
    end

    test "calculates the average song rating", %{song: song} do
      Ratings.add_rating(song, %{value: 4})
      Ratings.add_rating(song, %{value: 2})
      Ratings.add_rating(song, %{value: 1})
      Ratings.add_rating(song, %{value: 2})

      assert Artists.average_song_rating(song) == 2.25
    end

    test "returns 2.5 if there are no ratings for a song", %{song: song} do
      assert Artists.average_song_rating(song) == 2.5
    end
  end

end
