defmodule BandManager.Artists do
  import Ecto.Query, warn: false
  alias BandManager.Repo

  alias BandManager.Artists.Band

  def find_bands(search) do
    Repo.all(from b in Band, where: ilike(b.name, ^"%#{search}%") or ilike(b.genre, ^"%#{search}%"))
  end

  def list_bands do
    Repo.all(Band)
  end

  def get_band!(id) do
    Band
    |> Repo.get!(id)
    |> Repo.preload(albums: :songs)
  end

  def create_band(attrs \\ %{}) do
    %Band{}
    |> Band.changeset(attrs)
    |> Repo.insert()
  end

  def update_band(%Band{} = band, attrs) do
    band
    |> Band.changeset(attrs)
    |> Repo.update()
  end

  def delete_band(%Band{} = band) do
    Repo.delete(band)
  end

  def change_band(%Band{} = band) do
    Band.changeset(band, %{})
  end


  alias BandManager.Artists.Album

  def list_albums do
    Repo.all(Album)
  end

  def get_album!(id), do: Repo.get!(Album, id)

  def create_album(attrs \\ %{}) do
    %Album{}
    |> Album.changeset(attrs)
    |> Repo.insert()
  end

  def create_album_with_songs(band, attrs \\ %{}) do
    album_changeset = Album.changeset(%Album{}, Map.put(attrs, "band", band))

    multi = Ecto.Multi.new
    |> Ecto.Multi.insert(:album, album_changeset)
    |> Ecto.Multi.run(:songs, fn(%{album: album}) ->
      results = attrs["song_names"]
      |> String.split("\n")
      |> Enum.map(fn(song) ->
        create_song(%{"name" => song, "album" => album})
      end)

      {:ok, results}
    end)

    case Repo.transaction(multi) do
      {:ok, result} ->
        {:ok, {result.album, result.songs}}
      {:error, :album, album_changeset, _changes_so_far} ->
        {:error, :album, album_changeset}
      {:error, :songs, _, _} ->
        {:error, :songs}
    end
  end

  def update_album(%Album{} = album, attrs) do
    album
    |> Album.changeset(attrs)
    |> Repo.update()
  end

  def delete_album(%Album{} = album) do
    Repo.delete(album)
  end

  def change_album(%Album{} = album) do
    Album.changeset(album, %{})
  end


  alias BandManager.Artists.Song

  def get_song!(id), do: Repo.get!(Song, id)

  def create_song(attrs \\ %{}) do
    %Song{}
    |> Song.changeset(attrs)
    |> Repo.insert()
  end

  def average_song_rating(song) do
    average = song
    |> Ecto.assoc(:ratings)
    |> Repo.aggregate(:avg, :value)

    case average do
      nil -> 2.5
      avg -> Decimal.to_float(avg)
    end
  end
end
