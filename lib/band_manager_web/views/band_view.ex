defmodule BandManagerWeb.BandView do
  use BandManagerWeb, :view

  def albums(band) do
    band[:albums] || []
  end

  def rating(song) do
    rating = round(song[:rating] || 2.5)

    Enum.map (1..5), fn(i) ->
      content_tag :span, (if i <= rating, do: "★", else: "☆")
    end
  end
end
