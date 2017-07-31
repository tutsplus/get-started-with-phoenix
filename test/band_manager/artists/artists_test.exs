defmodule BandManager.ArtistsTest do
  use BandManager.DataCase

  alias BandManager.Artists

  describe "bands" do
    alias BandManager.Artists.Band

    @valid_attrs %{description: "some description", genre: "some genre", name: "some name"}
    @update_attrs %{description: "some updated description", genre: "some updated genre", name: "some updated name"}
    @invalid_attrs %{description: nil, genre: nil, name: nil}

    def band_fixture(attrs \\ %{}) do
      {:ok, band} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Artists.create_band()

      band
    end

    test "list_bands/0 returns all bands" do
      band = band_fixture()
      assert Artists.list_bands() == [band]
    end

    test "get_band!/1 returns the band with given id" do
      band = band_fixture()
      assert Artists.get_band!(band.id) == band
    end

    test "create_band/1 with valid data creates a band" do
      assert {:ok, %Band{} = band} = Artists.create_band(@valid_attrs)
      assert band.description == "some description"
      assert band.genre == "some genre"
      assert band.name == "some name"
    end

    test "create_band/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Artists.create_band(@invalid_attrs)
    end

    test "update_band/2 with valid data updates the band" do
      band = band_fixture()
      assert {:ok, band} = Artists.update_band(band, @update_attrs)
      assert %Band{} = band
      assert band.description == "some updated description"
      assert band.genre == "some updated genre"
      assert band.name == "some updated name"
    end

    test "update_band/2 with invalid data returns error changeset" do
      band = band_fixture()
      assert {:error, %Ecto.Changeset{}} = Artists.update_band(band, @invalid_attrs)
      assert band == Artists.get_band!(band.id)
    end

    test "delete_band/1 deletes the band" do
      band = band_fixture()
      assert {:ok, %Band{}} = Artists.delete_band(band)
      assert_raise Ecto.NoResultsError, fn -> Artists.get_band!(band.id) end
    end

    test "change_band/1 returns a band changeset" do
      band = band_fixture()
      assert %Ecto.Changeset{} = Artists.change_band(band)
    end
  end

  describe "albums" do
    alias BandManager.Artists.Album

    @valid_attrs %{name: "some name", year: 42}
    @update_attrs %{name: "some updated name", year: 43}
    @invalid_attrs %{name: nil, year: nil}

    def album_fixture(attrs \\ %{}) do
      {:ok, album} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Artists.create_album()

      album
    end

    test "list_albums/0 returns all albums" do
      album = album_fixture()
      assert Artists.list_albums() == [album]
    end

    test "get_album!/1 returns the album with given id" do
      album = album_fixture()
      assert Artists.get_album!(album.id) == album
    end

    test "create_album/1 with valid data creates a album" do
      assert {:ok, %Album{} = album} = Artists.create_album(@valid_attrs)
      assert album.name == "some name"
      assert album.year == 42
    end

    test "create_album/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Artists.create_album(@invalid_attrs)
    end

    test "update_album/2 with valid data updates the album" do
      album = album_fixture()
      assert {:ok, album} = Artists.update_album(album, @update_attrs)
      assert %Album{} = album
      assert album.name == "some updated name"
      assert album.year == 43
    end

    test "update_album/2 with invalid data returns error changeset" do
      album = album_fixture()
      assert {:error, %Ecto.Changeset{}} = Artists.update_album(album, @invalid_attrs)
      assert album == Artists.get_album!(album.id)
    end

    test "delete_album/1 deletes the album" do
      album = album_fixture()
      assert {:ok, %Album{}} = Artists.delete_album(album)
      assert_raise Ecto.NoResultsError, fn -> Artists.get_album!(album.id) end
    end

    test "change_album/1 returns a album changeset" do
      album = album_fixture()
      assert %Ecto.Changeset{} = Artists.change_album(album)
    end
  end
end
