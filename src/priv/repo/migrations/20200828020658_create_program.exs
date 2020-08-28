defmodule Lifts.Repo.Migrations.CreateProgram do
  use Ecto.Migration

  def change do
    create table(:programs) do
      add :name, :string

      timestamps
    end

    create unique_index(:programs, [:name])
  end
end
