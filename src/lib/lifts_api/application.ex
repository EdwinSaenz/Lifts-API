defmodule LiftsApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      LiftsApi.Repo,
      # Start the Telemetry supervisor
      LiftsApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiftsApi.PubSub},
      # Start the Endpoint (http/https)
      LiftsApiWeb.Endpoint
      # Start a worker by calling: LiftsApi.Worker.start_link(arg)
      # {LiftsApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiftsApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    LiftsApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
