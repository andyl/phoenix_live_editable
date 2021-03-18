defmodule Phoenix.LiveEditable.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: Phoenix.LiveEditable.PubSub}
      # Start a worker by calling: LiveEditable.Worker.start_link(arg)
      # {LiveEditable.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Phoenix.LiveEditable.Supervisor)
  end
end
