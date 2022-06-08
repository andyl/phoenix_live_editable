defmodule PleDemoBaseWeb.Test5Live do

  use PleDemoBaseWeb, :live_view
  use Phoenix.LvEditable

  # ----- lifecycle callbacks -----

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(_params, _url, socket) do
    {:noreply, socket}
  end

  # ----- event handlers -----

  def handle_event("save", %{"data" => data}, socket) do
    id = socket.assigns.focusid
    newdata = socket.assigns.data |> Map.merge(%{id => data})
    new_socket = assign(socket, data: newdata, focusid: "NONE")
    {:noreply, new_socket}
  end

  # ----- helpers -----

end
