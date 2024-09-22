defmodule ApiTemplatePhx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ApiTemplatePhxWeb.Telemetry,
      ApiTemplatePhx.Repo,
      {DNSCluster, query: Application.get_env(:api_template_phx, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ApiTemplatePhx.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ApiTemplatePhx.Finch},
      # Start a worker by calling: ApiTemplatePhx.Worker.start_link(arg)
      # {ApiTemplatePhx.Worker, arg},
      # Start to serve requests, typically the last entry
      ApiTemplatePhxWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ApiTemplatePhx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ApiTemplatePhxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
