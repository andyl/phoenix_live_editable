defmodule Phoenix.OldLiveEditableMixin do

  @moduledoc """
  Mixin for LiveEditable stateful components.any()

  Usage:

      defmodule MyStatefulLiveEditableComponent do
        import Phoenix.LiveView
        use Phoenix.LiveComponent
        use Phoenix.LiveEditableMixin

        # ----- event handlers -----

        def handle_event("save", params, socket) do
          # code...
          {:noreply, socket}
        end

      end
  """

  defmacro __using__(_opts) do
    quote do

      import Phoenix.LiveView
      use Phoenix.LiveComponent

      on_mount Phoenix.LiveEditableHooks

      # ----- lifecycle events -----

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
        IO.puts("EVENT FOCUS (live_editable_mixin)")
        new_socket = assign(socket, :focusid, id)
        {:noreply, new_socket}
      end

      def handle_event("cancel", _payload, socket) do
        IO.puts("EVENT CANCEL (live_editable_mixin)")
        {:noreply, assign(socket, :focusid, "NONE")}
      end

    end
  end

end
