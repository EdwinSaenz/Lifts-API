# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :lifts_api,
  ecto_repos: [LiftsApi.Repo]

# Configures the endpoint
config :lifts_api, LiftsApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WQchKs687nA2d9+OtZ7IXfCASs2ijrnwkiix9Zzbrxh05cV1ZEhtBhQ2ZQVNEfit",
  render_errors: [view: LiftsApiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LiftsApi.PubSub,
  live_view: [signing_salt: "VCQv9lk6"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
