defmodule LiftsWeb.ProgramView do
  use LiftsWeb, :view
  alias LiftsWeb.{ProgramView, WorkoutDayView}

  def render("index.json", %{programs: programs}) do
    programs
    |> render_many(ProgramView, "program.json")
  end

  def render("show.json", %{program: program}) do
    program
    |> render_one(ProgramView, "program_with_workout_days.json")
  end

  def render("program.json", %{program: program}) do
    %{id: program.id, name: program.name}
  end

  def render("program_with_workout_days.json", %{program: program}) do
    %{
      id: program.id,
      name: program.name,
      workoutDays: program.workout_days
      |> render_many(WorkoutDayView, "workout_day.json")}
  end
end
