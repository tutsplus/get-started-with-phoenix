defmodule BandManager.Ratings do
  import Ecto.Query, warn: false
  alias BandManager.Repo

  alias BandManager.Ratings.Rating

  def add_rating(item, attrs \\ %{}) do
    Ecto.build_assoc(item, :ratings)
    |> Rating.changeset(attrs)
    |> Repo.insert()
  end
end
