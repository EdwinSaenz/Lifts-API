# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :lifts,
  ecto_repos: [Lifts.Repo]

# Configures the endpoint
config :lifts, LiftsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yJf+e7wbl2+i1ZjS8HrOOZcccEo3lyhLKDQu5Q4OXH8N7kLgLkZ4b0ZS2AqHazun",
  render_errors: [view: LiftsWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Lifts.PubSub,
  live_view: [signing_salt: "+ev09kj2"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
