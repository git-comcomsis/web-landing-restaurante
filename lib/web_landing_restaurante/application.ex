defmodule WebLandingRestaurante.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      WebLandingRestauranteWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:web_landing_restaurante, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: WebLandingRestaurante.PubSub},
      # Start a worker by calling: WebLandingRestaurante.Worker.start_link(arg)
      # {WebLandingRestaurante.Worker, arg},
      # Start to serve requests, typically the last entry
      WebLandingRestauranteWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WebLandingRestaurante.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    WebLandingRestauranteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
