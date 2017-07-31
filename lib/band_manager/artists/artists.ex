defmodule BandManager.Artists do
  @moduledoc """
  The Artists context.
  """

  import Ecto.Query, warn: false
  alias BandManager.Repo

  alias BandManager.Artists.Band

  @doc """
  Returns the list of bands.

  ## Examples

      iex> list_bands()
      [%Band{}, ...]

  """
  def list_bands do
    Repo.all(Band)
  end

  @doc """
  Gets a single band.

  Raises `Ecto.NoResultsError` if the Band does not exist.

  ## Examples

      iex> get_band!(123)
      %Band{}

      iex> get_band!(456)
      ** (Ecto.NoResultsError)

  """
  def get_band!(id), do: Repo.get!(Band, id)

  @doc """
  Creates a band.

  ## Examples

      iex> create_band(%{field: value})
      {:ok, %Band{}}

      iex> create_band(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_band(attrs \\ %{}) do
    %Band{}
    |> Band.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a band.

  ## Examples

      iex> update_band(band, %{field: new_value})
      {:ok, %Band{}}

      iex> update_band(band, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_band(%Band{} = band, attrs) do
    band
    |> Band.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Band.

  ## Examples

      iex> delete_band(band)
      {:ok, %Band{}}

      iex> delete_band(band)
      {:error, %Ecto.Changeset{}}

  """
  def delete_band(%Band{} = band) do
    Repo.delete(band)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking band changes.

  ## Examples

      iex> change_band(band)
      %Ecto.Changeset{source: %Band{}}

  """
  def change_band(%Band{} = band) do
    Band.changeset(band, %{})
  end

  alias BandManager.Artists.Album

  @doc """
  Returns the list of albums.

  ## Examples

      iex> list_albums()
      [%Album{}, ...]

  """
  def list_albums do
    Repo.all(Album)
  end

  @doc """
  Gets a single album.

  Raises `Ecto.NoResultsError` if the Album does not exist.

  ## Examples

      iex> get_album!(123)
      %Album{}

      iex> get_album!(456)
      ** (Ecto.NoResultsError)

  """
  def get_album!(id), do: Repo.get!(Album, id)

  @doc """
  Creates a album.

  ## Examples

      iex> create_album(%{field: value})
      {:ok, %Album{}}

      iex> create_album(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_album(attrs \\ %{}) do
    %Album{}
    |> Album.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a album.

  ## Examples

      iex> update_album(album, %{field: new_value})
      {:ok, %Album{}}

      iex> update_album(album, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_album(%Album{} = album, attrs) do
    album
    |> Album.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Album.

  ## Examples

      iex> delete_album(album)
      {:ok, %Album{}}

      iex> delete_album(album)
      {:error, %Ecto.Changeset{}}

  """
  def delete_album(%Album{} = album) do
    Repo.delete(album)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking album changes.

  ## Examples

      iex> change_album(album)
      %Ecto.Changeset{source: %Album{}}

  """
  def change_album(%Album{} = album) do
    Album.changeset(album, %{})
  end
end
