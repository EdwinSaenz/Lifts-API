defmodule LiftsWeb.ProgramView do
  use LiftsWeb, :view

  def render("index.json", %{programs: programs}) do
    programs
    |> render_many(LiftsWeb.ProgramView, "program.json")
  end

  def render("program.json", %{program: program}) do
    %{id: program.id, name: program.name}
  end
end
