defmodule LiftsWeb.WorkoutDayController do
  use LiftsWeb, :controller
  alias Lifts.WorkoutDays

  action_fallback LiftsWeb.FallbackController

  def create(conn, params) do
    with {:ok, %{id: workout_day_id}} <- WorkoutDays.create_workout_day(params),
         {:ok, workout_day} <- WorkoutDays.get_workout_day(workout_day_id) do
      conn
      |> put_status(:created)
      |> render("show.json", workout_day: workout_day)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, workout_day} <- WorkoutDays.get_workout_day(String.to_integer(id)) do
      conn
      |> render("show.json", workout_day: workout_day)
    end
  end
end
