defmodule LiftsWeb.ExerciseView do
  use LiftsWeb, :view
  alias LiftsWeb.{ExerciseView, SetView}

  def render("show.json", %{exercise: exercise}) do
    exercise
    |> render_one(ExerciseView, "exercise_with_set_history.json")
  end

  def render("exercise.json", %{exercise: exercise}) do
    %{
      id: exercise.id,
      name: exercise.name,
      order: exercise.order
    }
  end

  def render("exercise_with_set_history.json", %{exercise: exercise}) do
    %{
      id: exercise.id,
      name: exercise.name,
      order: exercise.order,
      history:
        exercise.set_history
        |> render_many(SetView, "day_sets.json", as: :day_sets)
    }
  end
end
