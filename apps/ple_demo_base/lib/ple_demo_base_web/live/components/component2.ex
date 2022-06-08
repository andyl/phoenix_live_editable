defmodule PleDemoBaseWeb.Components.Component2 do
  import Phoenix.LiveView

  use Phoenix.LiveComponent

  @moduledoc """
  Component2 - Basic Stateful Component
  """

  # ----- lifecycle events -----

  def mount(socket) do
    {:ok, socket}
  end

  def update(assigns, socket) do
    attrs = [
      id: assigns[:id],
      data: "UPDATE #{time_now()}"
    ]
    {:ok, assign(socket, attrs)}
  end

  def render(assigns) do
    ~H"""
    <span style={linkstyle()} phx-click="focus" phx-target={@myself} id={@id}>
      <%= @data %>
    </span>
    """
  end

  # ----- helpers -----

  defp time_now do
    DateTime.utc_now() |> Calendar.strftime("%H:%M:%S")
  end

  defp linkstyle do
    "cursor: pointer; border-bottom: 1px dashed blue;"
  end
  # ----- event handlers -----

  def handle_event("focus", _data, socket) do
    new_socket = assign(socket, :data, "FOCUS #{time_now()}")
    {:noreply, new_socket}
  end

end
