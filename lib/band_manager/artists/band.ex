defmodule BandManager.Artists.Band do
  use Ecto.Schema
  import Ecto.Changeset
  alias BandManager.Artists.{Album, Band}


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "bands" do
    field :description, :string
    field :genre, :string
    field :name, :string

    has_many :albums, Album

    timestamps()
  end

  @doc false
  def changeset(%Band{} = band, attrs) do
    band
    |> cast(attrs, [:name, :genre, :description])
    |> validate_required([:name, :genre, :description])
  end
end
