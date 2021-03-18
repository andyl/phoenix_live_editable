defmodule PhxDemoBootstrap5.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhxDemoBootstrap5Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhxDemoBootstrap5.PubSub},
      # Start the Endpoint (http/https)
      PhxDemoBootstrap5Web.Endpoint
      # Start a worker by calling: PhxDemoBootstrap5.Worker.start_link(arg)
      # {PhxDemoBootstrap5.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxDemoBootstrap5.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhxDemoBootstrap5Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
