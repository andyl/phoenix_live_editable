defmodule Phoenix.LiveEditable.Handler.Default do
  @moduledoc """
  Default Handlers for Views and Phoenix.Editable.Base

  use Phoenix.LiveEditable.Handler.Default
  """

  defmacro __using__(_opts) do
    quote do

      # needed for 'assign'
      use Phoenix.Component

      def handle_event("ple-blur", data, socket) do
        {:noreply, assign(socket, :ple_mode, "anchor")}
      end

      def handle_event("ple-focus", data, socket) do
        {:noreply, assign(socket, :ple_mode, "focus")}
      end

      def handle_event("ple-default-save", data, socket) do
        {:noreply, assign(socket, ple_data: data["data"], ple_mode: "anchor")}
      end

      def handle_event(target, data, socket) do
        IO.puts("XXXXX -- UNHANDLED EVENT -- XXXXX")
        IO.inspect(target)
        IO.inspect(data)
        IO.puts("XXXXX -- fini -- XXXXX")
        {:noreply, socket}
      end
    end
  end
end
