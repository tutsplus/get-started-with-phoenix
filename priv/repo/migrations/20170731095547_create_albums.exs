defmodule BandManager.Repo.Migrations.CreateAlbums do
  use Ecto.Migration

  def change do
    create table(:albums, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :year, :integer
      add :band_id, references(:bands, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:albums, [:band_id])
  end
end
