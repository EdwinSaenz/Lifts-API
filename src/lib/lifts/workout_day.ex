defmodule Lifts.WorkoutDay do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workout_days" do
    field :name, :string
    field :order, :integer

    timestamps()

    belongs_to :program, Lifts.Program
    has_many :exercises, Lifts.Exercise
  end

  @doc false
  def changeset(workout_day, attrs) do
    workout_day
    |> cast(attrs, [:name, :order, :program_id])
    |> validate_required([:name, :order, :program_id])
    |> unique_constraint([:name, :program_id])
  end
end
