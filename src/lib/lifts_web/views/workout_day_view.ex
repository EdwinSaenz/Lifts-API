defmodule LiftsWeb.WorkoutDayView do
  use LiftsWeb, :view
  alias LiftsWeb.WorkoutDayView

  def render("workout_day.json", %{workout_day: workout_day}) do
    %{
      id: workout_day.id,
      name: workout_day.name,
      order: workout_day.order
    }
  end
end
