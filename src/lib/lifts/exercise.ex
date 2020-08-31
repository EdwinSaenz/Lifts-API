defmodule Lifts.Exercise do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exercises" do
    field :name, :string
    field :order, :integer

    timestamps()

    belongs_to :workout_day, Lifts.WorkoutDay
  end

  def changeset(exercise, attrs) do
    exercise
    |> cast(attrs, [:name, :order, :workout_day_id])
    |> validate_required([:name, :order, :workout_day_id])
    |> unique_constraint([:name, :workout_day_id])
  end
end
