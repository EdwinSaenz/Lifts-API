defmodule Lifts.WorkoutDays do
  @moduledoc """
  The WorkoutDays context.
  """

  import Ecto.Query, warn: false
  alias Lifts.{Repo, WorkoutDay}

  @doc """
  Returns the list of workout_days.

  ## Examples

      iex> list_workout_days()
      [%WorkoutDay{}, ...]

  """
  def list_workout_days do
    Repo.all(WorkoutDay)
  end

  @doc """
  Gets a single workout_day.

  Raises `Ecto.NoResultsError` if the WorkoutDay does not exist.

  ## Examples

      iex> get_workout_day(123)
      {:ok, %WorkoutDay{}}

      iex> get_workout_day(456)
      {:error, :not_found}

  """
  def get_workout_day(id) do
    case WorkoutDay |> Repo.get(id) do
      nil ->
        {:error, :not_found}

      workout_day ->
        workout_day =
          workout_day
          |> Repo.preload(:exercises)

        {:ok, workout_day}
    end
  end

  @doc """
  Creates a workout_day.

  ## Examples

      iex> create_workout_day(%{field: value})
      {:ok, %WorkoutDay{}}

      iex> create_workout_day(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_workout_day(attrs \\ %{}) do
    result =
      %WorkoutDay{}
      |> WorkoutDay.changeset(attrs)
      |> Repo.insert()

    case result do
      {:ok, workout_day} ->
        workout_day |> set_order

      _ ->
        result
    end
  end

  defp set_order(%WorkoutDay{} = workout_day) do
    case WorkoutDay
         |> where([wd], wd.program_id == ^workout_day.program_id)
         |> where([wd], not is_nil(wd.order))
         |> last(:order)
         |> Repo.one() do
      %WorkoutDay{order: order} ->
        workout_day
        |> update_workout_day(%{order: order + 1})

      nil ->
        workout_day
        |> update_workout_day(%{order: 1})
    end
  end

  @doc """
  Updates a workout_day.

  ## Examples

      iex> update_workout_day(workout_day, %{field: new_value})
      {:ok, %WorkoutDay{}}

      iex> update_workout_day(workout_day, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_workout_day(%WorkoutDay{} = workout_day, attrs) do
    workout_day
    |> WorkoutDay.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a workout_day.

  ## Examples

      iex> delete_workout_day(workout_day)
      {:ok, %WorkoutDay{}}

      iex> delete_workout_day(workout_day)
      {:error, %Ecto.Changeset{}}

  """
  def delete_workout_day(%WorkoutDay{} = workout_day) do
    Repo.delete(workout_day)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking workout_day changes.

  ## Examples

      iex> change_workout_day(workout_day)
      %Ecto.Changeset{data: %WorkoutDay{}}

  """
  def change_workout_day(%WorkoutDay{} = workout_day, attrs \\ %{}) do
    WorkoutDay.changeset(workout_day, attrs)
  end
end
