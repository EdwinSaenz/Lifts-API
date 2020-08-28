defmodule Lifts.Repo do
  use Ecto.Repo,
    otp_app: :lifts,
    adapter: Ecto.Adapters.Postgres
end
