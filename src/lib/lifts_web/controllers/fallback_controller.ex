defmodule LiftsWeb.FallbackController do
  use LiftsWeb, :controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(LiftsWeb.ErrorView)
    |> render(:"404")
  end
end
