defmodule BandManager.Repo.Migrations.CreateBands do
  use Ecto.Migration

  def change do
    create table(:bands, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :genre, :string
      add :description, :text

      timestamps()
    end

    create index(:bands, [:name])
    create index(:bands, [:genre])
  end
end
