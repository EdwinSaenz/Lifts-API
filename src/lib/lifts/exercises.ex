defmodule Lifts.Exercises do
  @moduledoc """
  The Exercises context.
  """

  import Ecto.Query, warn: false
  alias Lifts.{Repo, Exercise, Set}

  @doc """
  Returns the list of exercises.

  ## Examples

      iex> list_exercises()
      [%Exercise{}, ...]

  """
  def list_exercises do
    Repo.all(Exercise)
  end

  @doc """
  Gets a single exercise.

  Raises `Ecto.NoResultsError` if the Exercise does not exist.

  ## Examples

      iex> get_exercise(123)
      {:ok, %Exercise{}}

      iex> get_exercise(456)
      {:error, :not_found}

  """
  def get_exercise(id) do
    case Exercise |> Repo.get(id) do
      nil ->
        {:error, :not_found}

      exercise ->
        exercise =
          exercise
          |> Map.put_new(:set_history, get_set_history(exercise.id))

        {:ok, exercise}
    end
  end

  def get_set_history(exercise_id) do
    from(
      s in Set,
      where: s.exercise_id == ^exercise_id,
      group_by: [
        fragment("date_trunc('day', ?)", s.inserted_at)
      ],
      select: %{
        day: fragment("date_trunc('day', ?)", s.inserted_at),
        sets:
          fragment(
            "json_agg(
              json_build_object(
                'id', ?,
                'weight', ?,
                'repetitions', ?,
                'is_weighted', ?,
                'order', ?)
              order by ?) AS sets",
            s.id,
            s.weight,
            s.repetitions,
            s.is_weighted,
            s.order,
            s.order
          )
      },
      order_by: [
        desc: fragment("date_trunc('day', ?)", s.inserted_at)
      ]
    )
    |> Repo.all()
  end

  @doc """
  Creates a exercise.

  ## Examples

      iex> create_exercise(%{field: value})
      {:ok, %Exercise{}}

      iex> create_exercise(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_exercise(attrs \\ %{}) do
    result =
      %Exercise{}
      |> Exercise.changeset(attrs)
      |> Repo.insert()

    case result do
      {:ok, exercise} ->
        exercise |> set_order

      _ ->
        result
    end
  end

  defp set_order(%Exercise{} = exercise) do
    case Exercise
         |> where([e], e.workout_day_id == ^exercise.workout_day_id)
         |> where([e], not is_nil(e.order))
         |> last(:order)
         |> Repo.one() do
      %Exercise{order: order} ->
        exercise
        |> update_exercise(%{order: order + 1})

      nil ->
        exercise
        |> update_exercise(%{order: 1})
    end
  end

  @doc """
  Updates a exercise.

  ## Examples

      iex> update_exercise(exercise, %{field: new_value})
      {:ok, %Exercise{}}

      iex> update_exercise(exercise, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_exercise(%Exercise{} = exercise, attrs) do
    exercise
    |> Exercise.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a exercise.

  ## Examples

      iex> delete_exercise(exercise)
      {:ok, %Exercise{}}

      iex> delete_exercise(exercise)
      {:error, %Ecto.Changeset{}}

  """
  def delete_exercise(%Exercise{} = exercise) do
    Repo.delete(exercise)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking exercise changes.

  ## Examples

      iex> change_exercise(exercise)
      %Ecto.Changeset{data: %Exercise{}}

  """
  def change_exercise(%Exercise{} = exercise, attrs \\ %{}) do
    Exercise.changeset(exercise, attrs)
  end
end
