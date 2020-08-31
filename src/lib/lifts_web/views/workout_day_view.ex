defmodule LiftsWeb.WorkoutDayView do
  use LiftsWeb, :view
  alias LiftsWeb.{WorkoutDayView, ExerciseView}

  def render("show.json", %{workout_day: workout_day}) do
    workout_day
    |> render_one(WorkoutDayView, "workout_day_with_exercises.json")
  end

  def render("workout_day.json", %{workout_day: workout_day}) do
    %{
      id: workout_day.id,
      name: workout_day.name,
      order: workout_day.order
    }
  end

  def render("workout_day_with_exercises.json", %{workout_day: workout_day}) do
    %{
      id: workout_day.id,
      name: workout_day.name,
      order: workout_day.order,
      exercises:
        workout_day.exercises
        |> render_many(ExerciseView, "exercise.json")
    }
  end
end
