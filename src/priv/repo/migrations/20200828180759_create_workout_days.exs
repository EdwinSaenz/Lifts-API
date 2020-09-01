defmodule Lifts.Repo.Migrations.CreateWorkoutDays do
  use Ecto.Migration

  def change do
    create table(:workout_days) do
      add :name, :string
      add :order, :integer

      timestamps()

      add :program_id, references(:programs)
    end

    create unique_index(:workout_days, [:name, :program_id])
  end
end
