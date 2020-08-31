defmodule LiftsWeb.ExerciseView do
  use LiftsWeb, :view
  alias LiftsWeb.ExerciseView

  def render("show.json", %{exercise: exercise}) do
    exercise
    |> render_one(ExerciseView, "exercise.json")
  end

  def render("exercise.json", %{exercise: exercise}) do
    %{
      id: exercise.id,
      name: exercise.name,
      order: exercise.order
    }
  end
end
