defmodule Lifts.Sets do
  @moduledoc """
  The Sets context.
  """

  import Ecto.Query, warn: false
  alias Lifts.Repo

  alias Lifts.Set

  @doc """
  Returns the list of sets.

  ## Examples

      iex> list_sets()
      [%Set{}, ...]

  """
  def list_sets do
    Repo.all(Set)
  end

  @doc """
  Gets a single set.

  Raises `Ecto.NoResultsError` if the Set does not exist.

  ## Examples

      iex> get_set(123)
      {:ok, %Set{}}

      iex> get_set(456)
      {:error, :not_found}

  """
  def get_set(id) do
    case Set |> Repo.get(id) do
      nil -> {:error, :not_found}
      set -> {:ok, set}
    end
  end

  @doc """
  Creates a set.

  ## Examples

      iex> create_set(%{field: value})
      {:ok, %Set{}}

      iex> create_set(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_set(attrs \\ %{}) do
    result =
      %Set{}
      |> Set.changeset(attrs)
      |> Repo.insert()

    case result do
      {:ok, set} ->
        set |> set_order

      _ ->
        result
    end
  end

  defp set_order(%Set{} = set) do
    case Set
         |> where([e], e.exercise_id == ^set.exercise_id)
         |> where([e], not is_nil(e.order))
         |> last(:order)
         |> Repo.one() do
      %Set{order: order} ->
        set
        |> update_set(%{order: order + 1})

      nil ->
        set
        |> update_set(%{order: 1})
    end
  end

  @doc """
  Updates a set.

  ## Examples

      iex> update_set(set, %{field: new_value})
      {:ok, %Set{}}

      iex> update_set(set, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_set(%Set{} = set, attrs) do
    set
    |> Set.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a set.

  ## Examples

      iex> delete_set(set)
      {:ok, %Set{}}

      iex> delete_set(set)
      {:error, %Ecto.Changeset{}}

  """
  def delete_set(%Set{} = set) do
    Repo.delete(set)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking set changes.

  ## Examples

      iex> change_set(set)
      %Ecto.Changeset{data: %Set{}}

  """
  def change_set(%Set{} = set, attrs \\ %{}) do
    Set.changeset(set, attrs)
  end
end
