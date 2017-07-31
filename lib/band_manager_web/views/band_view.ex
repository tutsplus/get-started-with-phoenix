defmodule BandManagerWeb.BandView do
  use BandManagerWeb, :view

  def rating(song) do
    rating = round(2.5)

    Enum.map (1..5), fn(i) ->
      content_tag :span, (if i <= rating, do: "★", else: "☆")
    end
  end
end
