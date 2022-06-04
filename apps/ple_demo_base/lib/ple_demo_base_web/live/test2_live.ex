defmodule PleDemoBaseWeb.Test2Live do

  use PleDemoBaseWeb, :live_view
  use Phoenix.LiveEditable

  # ----- lifecycle callbacks -----

  def mount(_params, _session, socket) do
    {:ok, assign(socket, id: "IdOne", data: "Click Me to Edit")}
  end

  # ----- event handlers -----

  def handle_event("save", %{"data" => data}, socket) do
    new_socket = assign(socket, data: data, focusid: "NONE")
    {:noreply, new_socket}
  end

  # ----- helpers -----

end
