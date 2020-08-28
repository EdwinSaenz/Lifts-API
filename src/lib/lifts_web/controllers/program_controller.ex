defmodule LiftsWeb.ProgramController do
  use LiftsWeb, :controller
  alias Lifts.{Repo, Program}

  def index(conn, _params) do
    programs = Repo.all(Program)

    conn
    |> render("index.json", programs: programs)
  end
end
