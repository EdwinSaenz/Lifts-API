defmodule LiftsWeb.ProgramController do
  use LiftsWeb, :controller
  alias Lifts.Programs

  action_fallback LiftsWeb.FallbackController

  def index(conn, _params) do
    programs = Programs.list_programs()

    conn
    |> render("index.json", programs: programs)
  end

  def show(conn, %{"id" => id}) do
    with {:ok, program} <- Programs.get_program(String.to_integer(id)) do
      conn
      |> render("show.json", program: program)
    end
  end
end
