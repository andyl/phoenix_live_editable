defmodule Phoenix.Editable.Handler.Test do
  @moduledoc """
  Prototype event-handler methods that can be used in LiveViews and
  LiveComponents.

  Example:

      use Phoenix.LiveEditable.Handler.Tst

  """

  defmacro __using__(_opts) do
    quote do
      def handle_event("ple-focus", data, socket) do
        IO.puts("Handler.Tst")
        IO.inspect("ple-focus")
        IO.inspect(data)
        {:noreply, socket}
      end
    end
  end
end
