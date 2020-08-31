defmodule LiftsWeb.WorkoutDayController do
  use LiftsWeb, :controller
  alias Lifts.WorkoutDays

  action_fallback LiftsWeb.FallbackController

  def create(conn, assigns) do
    with {:ok, workout_day} <- WorkoutDays.create_workout_day(assigns) do
      conn
      |> put_status(:created)
      |> render("show.json", workout_day: workout_day)
    end
  end
end
