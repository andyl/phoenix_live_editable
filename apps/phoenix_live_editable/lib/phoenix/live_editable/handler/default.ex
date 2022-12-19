defmodule Phoenix.LiveEditable.Handler.Default do

  def handle_event(_any, _data, socket) do
    {:noreply, socket}
  end
end
