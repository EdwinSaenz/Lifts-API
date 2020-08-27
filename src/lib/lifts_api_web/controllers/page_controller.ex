defmodule LiftsApiWeb.PageController do
  use LiftsApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
