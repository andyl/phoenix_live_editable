defmodule LiveEditableWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LiveEditableWeb.Telemetry,
      # Start the Endpoint (http/https)
      LiveEditableWeb.Endpoint
      # Start a worker by calling: LiveEditableWeb.Worker.start_link(arg)
      # {LiveEditableWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveEditableWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    LiveEditableWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
