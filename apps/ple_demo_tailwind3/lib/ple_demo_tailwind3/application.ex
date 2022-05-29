defmodule PleDemoTailwind3.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PleDemoTailwind3Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PleDemoTailwind3.PubSub},
      # Start the Endpoint (http/https)
      PleDemoTailwind3Web.Endpoint
      # Start a worker by calling: PleDemoTailwind3.Worker.start_link(arg)
      # {PleDemoTailwind3.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PleDemoTailwind3.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PleDemoTailwind3Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
