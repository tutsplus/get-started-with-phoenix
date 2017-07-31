defmodule BandManagerWeb.BandView do
  use BandManagerWeb, :view

  def rating(song) do
    rating = round(BandManager.Artists.average_song_rating(song))

    Enum.map (5..1), fn(i) ->
      content_tag :span, "",
        id: "rating-#{song.id}-#{i}",
        class: "glyphicon glyphicon-star#{if i > rating do "-empty" end} rating-star",
        "data-song": song.id,
        "data-rating": i
    end
  end
end
