defmodule LiftsWeb.ExerciseView do
  use LiftsWeb, :view
  alias LiftsWeb.{ExerciseView, SetView}

  def render("show.json", %{exercise: exercise}) do
    exercise
    |> render_one(ExerciseView, "exercise_with_sets.json")
  end

  def render("exercise.json", %{exercise: exercise}) do
    %{
      id: exercise.id,
      name: exercise.name,
      order: exercise.order
    }
  end

  def render("exercise_with_sets.json", %{exercise: exercise}) do
    %{
      id: exercise.id,
      name: exercise.name,
      order: exercise.order,
      sets:
        exercise.sets
        |> render_many(SetView, "set.json")
    }
  end
end
