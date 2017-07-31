defmodule BandManager.Repo.Migrations.CreateSongRatings do
  use Ecto.Migration

  def change do
    create table(:song_ratings, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :value, :integer
      add :assoc_id, references(:songs, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:song_ratings, [:assoc_id])
  end
end
