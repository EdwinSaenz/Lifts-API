defmodule Lifts.WorkoutDay do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workout_days" do
    field :name, :string
    field :order, :integer

    timestamps()

    belongs_to :program, Lifts.Program
  end

  @doc false
  def changeset(workout_day, attrs) do
    workout_day
    |> cast(attrs, [:name, :order])
    |> validate_required([:name, :order])
  end
end