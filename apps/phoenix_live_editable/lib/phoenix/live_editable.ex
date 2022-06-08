defmodule Phoenix.LiveEditable do
  import Phoenix.LiveView

  use Phoenix.LiveComponent

  # ----- lifecycle callbacks -----

  def mount(socket) do
    {:ok, socket}
  end

  def update(assigns, socket) do

    Map.has_key?(assigns, :id)        || raise("Needs `:id` assign")
    Map.has_key?(assigns, :type)      || raise("Needs `:type` assign ('text' | 'select')")
    Map.has_key?(assigns, :focusid)   || raise("Needs `:focusid` assign")
    Map.has_key?(assigns, :interface) || raise("Needs `:interface` assign")

    assigns = set_env(assigns)

    {:ok, assign(socket, assigns)}
  end

  def render(assigns) do
    module  = interface_module(assigns)
    module.render(assigns)
  end

  # ----- event handlers -----

  # ----- view helpers -----

  defp set_env(assigns) do
    mode = if assigns.id == assigns.focusid, do: "focus", else: "anchor"
    assigns
    |> Map.put(:mode, mode)
  end

  def interface_module(assigns) do
    assigns.interface
  end

  defmacro __using__(_opts) do
    quote do

      on_mount Phoenix.LiveEditableHooks

      # def handle_event("focus", %{"id" => id}, socket) do
      #   IO.puts("EVENT FOCUS (live_editable)")
      #   new_socket = assign(socket, :focusid, id)
      #   {:noreply, new_socket}
      # end
      #
      # def handle_event("cancel", _payload, socket) do
      #   IO.puts("EVENT CANCEL (live_editable)")
      #   {:noreply, assign(socket, :focusid, "NONE")}
      # end

    end
  end
end
