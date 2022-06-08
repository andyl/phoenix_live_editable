defmodule Phoenix.LvEditable do

  @moduledoc """

  View-Level LiveEditable Utiltities

      defmodule MyView do
        use MyAppWeb, :live_view
        use Phoenix.LvEditable

        ...

      end

  Layered configuration:
  - hardcoded default -> config -> view -> tag -> handler
  - values can be overridden

  """

  defstruct [
    # editable data - can be nil
    ple_data: nil,
    # form type: <text | select | multi-select | radio | ...>
    ple_type: "text",
    # render mode: <anchor | focus>
    ple_mode: "anchor",
    # display style: <inline | popup>
    ple_style: "inline",
    # submit action: anything
    ple_action: "save",
    # handler module - can reset in view or tag
    ple_handler: Phoenix.LiveEditable.Handler.Default,
    # interface module: see Phoenix.LiveEditable.Interface.*
    ple_interface: Phoenix.LiveEditable.Interface.Milligram,
  ]

  # ----- view helpers -----

  defmacro __using__(_opts) do
    quote do

      on_mount Phoenix.LvEditableHooks

      # ----- view helpers -----

      # defp set_env(assigns) do
      #   mode = if assigns.id == assigns.focusid, do: "focus", else: "anchor"
      #   assigns
      #   |> Map.put(:mode, mode)
      # end
      #
      # def interface_module(assigns) do
      #   assigns.interface
      # end

      # ----- event handlers -----

      # def handle_event("focus", %{"id" => id}, socket) do
      #   IO.puts "COMPONENT1 FOCUS"
      #   new_socket = assign(socket, :focusid, id)
      #   {:noreply, new_socket}
      # end

    end
  end
end
