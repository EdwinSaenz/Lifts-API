defmodule Lifts.Repo.Migrations.CreateExercises do
  use Ecto.Migration

  def change do
    create table(:exercises) do
      add :name, :string
      add :order, :integer

      timestamps()

      add :workout_day_id, references(:workout_days)
    end

    create unique_index(:exercises, [:name, :workout_day_id])
  end
end
