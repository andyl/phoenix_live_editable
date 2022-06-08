defmodule PleDemoBaseWeb.Components.Component1 do
  import Phoenix.LiveView
  use Phoenix.LiveComponent

  on_mount Phoenix.LiveEditableHooks

  # ----- lifecycle events -----

  def mount(socket) do
    {:ok, socket}
  end

  def update(assigns, socket) do
    Map.has_key?(assigns, :id) || raise("Needs `:id` assign")
    Map.has_key?(assigns, :type) || raise("Needs `:type` assign ('text' | 'select')")
    Map.has_key?(assigns, :focusid) || raise("Needs `:focusid` assign")
    Map.has_key?(assigns, :interface) || raise("Needs `:interface` assign")

    assigns = set_env(assigns)

    {:ok, assign(socket, assigns)}
  end

  def render(assigns) do
    IO.inspect(assigns, label: "RENDERYO")
    module = interface_module(assigns)
    module.render(assigns)
  end

  # ----- helpers -----

  def set_env(assigns) do
    mode = if assigns.id == assigns.focusid, do: "focus", else: "anchor"

    assigns
    |> Map.put(:mode, mode)
  end

  def interface_module(assigns) do
    assigns.interface
  end

  # ----- event handlers -----

  def handle_event("focus", %{"id" => id}, socket) do
    IO.puts "COMPONENT1 FOCUS"
    new_socket = assign(socket, :focusid, id)
    {:noreply, new_socket}
  end

  def handle_event("cancel", _payload, socket) do
    IO.puts "COMPONENT1 CANCEL"
    {:noreply, assign(socket, :focusid, "NONE")}
  end

  def handle_event("update", _payload, socket) do
    IO.puts "COMPONENT1 UPDATE"
    {:noreply, assign(socket, :focusid, "NONE")}
  end

end
