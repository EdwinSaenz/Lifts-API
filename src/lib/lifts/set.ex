defmodule Lifts.Set do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sets" do
    field :weight, :float
    field :repetitions, :integer
    field :is_weighted, :boolean
    field :order, :integer

    timestamps()

    belongs_to :exercise, Lifts.Exercise
  end

  def changeset(set, attrs) do
    set
    |> cast(attrs, [:weight, :repetitions, :is_weighted, :order, :exercise_id])
    |> validate_required([:repetitions, :is_weighted, :exercise_id])
    |> validate_number(:repetitions, greater_than: 0)
    |> validate_weight()
    |> foreign_key_constraint(:exercise_id)
  end

  def validate_weight(changeset) do
    if !changeset.valid? do
      changeset
    else
      is_weighted = get_field(changeset, :is_weighted)
      weight = get_field(changeset, :weight)

      is_valid = !is_weighted || (weight != nil && weight > 0)

      case is_valid do
        true -> changeset
        _ -> add_error(changeset, :weight, "weight is required if set is weighted.")
      end
    end
  end
end
