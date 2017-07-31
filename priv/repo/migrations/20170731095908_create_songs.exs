defmodule BandManager.Repo.Migrations.CreateSongs do
  use Ecto.Migration

  def change do
    create table(:songs, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :album_id, references(:albums, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:songs, [:album_id])
  end
end
