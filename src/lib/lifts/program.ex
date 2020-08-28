defmodule Lifts.Program do
  use Ecto.Schema
  import Ecto.Changeset
  alias Lifts.Program

  schema "programs" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Program{} = program, attrs) do
    program
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end