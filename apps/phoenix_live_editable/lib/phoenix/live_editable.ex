defmodule Phoenix.LiveEditable do
  import Phoenix.LiveView

  use Phoenix.LiveComponent

  # ----- lifecycle callbacks -----

  def mount(socket) do
    # {:ok, assign(socket, :focusid, "NONE")}
    {:ok, socket}
  end

  def update(assigns, socket) do
    Map.has_key?(assigns, :id)   || raise("Needs `:id` assign")
    Map.has_key?(assigns, :type) || raise("Needs `:type` assign ('text' | 'select')")

    assigns = set_env(assigns)

    # IO.inspect(assigns, label: "UPDATE ASSIG==>>")
    # IO.inspect(socket, label: "UPDATE SOCK==>>")

    {:ok, assign(socket, assigns)}
  end

  def render(assigns) do
    # IO.inspect(assigns, label: "RENDER ASSIG==>>")
    module  = interface_module()
    module.render(assigns)
  end

  # ----- event handlers -----

  # ----- view helpers -----

  defp set_env(assigns) do
    mode = if assigns.id == assigns.focusid, do: "focus", else: "anchor"
    assigns
    |> Map.put(:mode, mode)
    # |> IO.inspect(label: "SETENV")
  end

      def interface_module do
        _app_name = Application.get_application(__MODULE__) # |> IO.inspect(label: "APPNAME ------->>>>")
        case Application.fetch_env(:phoenix_live_editable, :css_framework) do
          {:ok, module} ->
            module
          error ->
            IO.inspect "+++++++++++++++++++++++++++++++++++++++"
            IO.inspect "ERROR INTERFACE MODULE"
            IO.inspect error
            IO.inspect "+++++++++++++++++++++++++++++++++++++++"
            Phoenix.LiveEditable.Interface.Milligram
        end
      end

  defmacro __using__(_opts) do
    quote do

      on_mount Phoenix.LiveEditableHooks

      def handle_event("focus", %{"id" => id}, socket) do
        new_socket = assign(socket, :focusid, id)
        {:noreply, new_socket}
      end

      def handle_event("cancel", _payload, socket) do
        {:noreply, assign(socket, :focusid, "NONE")}
      end

    end
  end
end
