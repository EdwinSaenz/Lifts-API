defmodule Lifts.Repo.Migrations.CreateSets do
  use Ecto.Migration

  def change do
    create table(:sets) do
      add :weight, :float
      add :repetitions, :integer
      add :is_weighted, :boolean
      add :order, :integer

      timestamps()

      add :exercise_id, references(:exercises)
    end
  end
end
