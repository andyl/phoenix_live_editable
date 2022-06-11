defmodule Phoenix.LiveEditable.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Phoenix.PubSub, name: Phoenix.LiveEditable.PubSub},
      {Registry, keys: :unique, name: Phoenix.LiveEditable.Registry}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Phoenix.LiveEditable.Supervisor)
  end
end
