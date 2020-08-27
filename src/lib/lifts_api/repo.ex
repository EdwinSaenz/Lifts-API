defmodule LiftsApi.Repo do
  use Ecto.Repo,
    otp_app: :lifts_api,
    adapter: Ecto.Adapters.Postgres
end
