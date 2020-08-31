defmodule Lifts.WorkoutDays do
  @moduledoc """
  The WorkoutDays context.
  """

  import Ecto.Query, warn: false
  alias Lifts.Repo

  alias Lifts.WorkoutDay

  @doc """
  Creates a workout_day.

  ## Examples

      iex> create_workout_day(%{field: value})
      {:ok, %WorkoutDay{}}

      iex> create_workout_day(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_workout_day(attrs \\ %{}) do
    %WorkoutDay{}
    |> WorkoutDay.changeset(attrs)
    |> Repo.insert()
  end
end
