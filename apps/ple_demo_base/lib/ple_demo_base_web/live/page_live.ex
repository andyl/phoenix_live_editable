defmodule PleDemoBaseWeb.PageLive do
  use PleDemoBaseWeb, :live_view
  use Phoenix.LiveEditable

  alias Phx.Demo.Helpers

  # ----- lifecycle callbacks -----

  def mount(_params, _session, socket) do
    newsocket =
      socket
      |> assign(:id, "IdOne")
      |> assign(:data, "CLICK ME TO EDIT")
      |> assign(:focusid, "--NONE--")

    {:ok, newsocket}
  end

  def handle_params(_params, url, socket) do
    {:noreply, assign(socket, :url, url)}
  end

  # ----- event handlers -----

  def handle_event("save", %{"data" => data}, socket) do
    new_socket = assign(socket, data: data, focusid: "NONE")
    {:noreply, new_socket}
  end

  # ----- helpers -----

end
