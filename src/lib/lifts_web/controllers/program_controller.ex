defmodule LiftsWeb.ProgramController do
  use LiftsWeb, :controller
  alias Lifts.{Programs, Program}

  action_fallback LiftsWeb.FallbackController

  def index(conn, _params) do
    programs = Programs.list_programs()

    conn
    |> render("index.json", programs: programs)
  end

  def create(conn, params) do
    with {:ok, %Program{id: program_id}} <- Programs.create_program(params),
         {:ok, program} <- Programs.get_program(program_id) do
      conn
      |> render("show.json", program: program)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, program} <- Programs.get_program(String.to_integer(id)) do
      conn
      |> render("show.json", program: program)
    end
  end
end
