defmodule LiftsWeb.SetController do
  use LiftsWeb, :controller
  alias Lifts.Sets

  action_fallback LiftsWeb.FallbackController

  def create(conn, params) do
    with {:ok, set} <- Sets.create_set(params) do
      conn
      |> put_status(:created)
      |> render("show.json", set: set)
    end
  end
end
