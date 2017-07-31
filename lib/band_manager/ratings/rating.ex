defmodule BandManager.Ratings.Rating do
  use Ecto.Schema
  import Ecto.Changeset
  alias BandManager.Ratings.Rating


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "abstract table: ratings" do
    field :value, :integer
    field :assoc_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(%Rating{} = rating, attrs) do
    rating
    |> cast(attrs, [:value])
    |> validate_required([:value])
  end
end
