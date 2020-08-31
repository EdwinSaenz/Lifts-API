defmodule LiftsWeb.FallbackController do
  use LiftsWeb, :controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(LiftsWeb.ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(LiftsWeb.ChangesetView, "error.json", changeset: changeset)
  end
end
