defmodule LiftsWeb.ExerciseController do
  use LiftsWeb, :controller
  alias Lifts.{Exercises, Exercise}

  action_fallback LiftsWeb.FallbackController

  def index(conn, _params) do
    exercises = Exercises.list_exercises()

    conn
    |> render("index.json", exercises: exercises)
  end

  def create(conn, params) do
    with {:ok, %Exercise{id: exercise_id}} <- Exercises.create_exercise(params),
         {:ok, exercise} <- Exercises.get_exercise(exercise_id) do
      conn
      |> put_status(:created)
      |> render("show.json", exercise: exercise)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, exercise} <- Exercises.get_exercise(String.to_integer(id)) do
      conn
      |> render("show.json", exercise: exercise)
    end
  end
end
