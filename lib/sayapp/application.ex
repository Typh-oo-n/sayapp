defmodule Sayapp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SayappWeb.Telemetry,
      Sayapp.Repo,
      {DNSCluster, query: Application.get_env(:sayapp, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Sayapp.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Sayapp.Finch},
      # Start a worker by calling: Sayapp.Worker.start_link(arg)
      # {Sayapp.Worker, arg},
      # Start to serve requests, typically the last entry
      SayappWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sayapp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SayappWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
