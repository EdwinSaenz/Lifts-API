defmodule Lifts.Exercise do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exercises" do
    field :name, :string
    field :order, :integer

    timestamps()

    belongs_to :workout_day, Lifts.WorkoutDay
    has_many :sets, Lifts.Set
  end

  def changeset(exercise, attrs) do
    exercise
    |> cast(attrs, [:name, :order, :workout_day_id])
    |> validate_required([:name, :workout_day_id])
    |> unique_constraint([:name, :workout_day_id])
    |> foreign_key_constraint(:workout_day_id)
  end
end
