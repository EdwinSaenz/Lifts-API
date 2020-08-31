defmodule Lifts.Program do
  use Ecto.Schema
  import Ecto.Changeset
  alias Lifts.Program

  schema "programs" do
    field :name, :string

    timestamps()

    has_many :workout_days, Lifts.WorkoutDay
  end

  @doc false
  def changeset(%Program{} = program, attrs) do
    program
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint([:name])
  end
end
