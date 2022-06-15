defmodule PleDemoBaseWeb.Test2Live do

  use PleDemoBaseWeb, :live_view
  use Phoenix.LiveEditableView

  import PleDemoBase.Components

  # ----- lifecycle callbacks -----

  def mount(_params, _session, socket) do
    {:ok, assign(socket, id: "IdOne", data: "Click Me to Edit")}
  end

  def handle_params(_params, _url, socket) do
    {:noreply, socket}
  end

  # ----- helpers -----

end
