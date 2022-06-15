defmodule Phoenix.LiveEditable.Handler.Default do

  use Phoenix.LiveEditableComponent

  # ----- event handlers -----

  def handle_event(_any, _data, socket) do
    {:noreply, socket}
  end
end
