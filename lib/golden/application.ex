defmodule Golden.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Golden.Repo,
      # Start the Telemetry supervisor
      GoldenWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Golden.PubSub},
      # Start the Endpoint (http/https)
      GoldenWeb.Endpoint
      # Start a worker by calling: Golden.Worker.start_link(arg)
      # {Golden.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Golden.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GoldenWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
