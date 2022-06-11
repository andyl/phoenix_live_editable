defmodule Phoenix.LiveEditable.Handler.Default do

  use Phoenix.LvEditableComponent

  # ----- event handlers -----

  def handle_event(_all, _data, socket) do
    IO.puts("DEFAULT HANDLER")
    {:noreply, socket}
  end
end
