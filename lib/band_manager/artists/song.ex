defmodule BandManager.Artists.Song do
  use Ecto.Schema
  import Ecto.Changeset
  alias BandManager.Artists.{Album, Song}


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "songs" do
    field :name, :string

    belongs_to :album, Album

    timestamps()
  end

  @doc false
  def changeset(%Song{} = song, attrs) do
    song
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
