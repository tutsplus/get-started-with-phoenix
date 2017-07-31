defmodule BandManager.Artists.Album do
  use Ecto.Schema
  import Ecto.Changeset
  alias BandManager.Artists.{Album, Band, Song}


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "albums" do
    field :name, :string
    field :year, :integer

    belongs_to :band, Band
    has_many :songs, Song

    timestamps()
  end

  @doc false
  def changeset(%Album{} = album, attrs) do
    album
    |> cast(attrs, [:name, :year])
    |> validate_required([:name, :year])
  end
end
