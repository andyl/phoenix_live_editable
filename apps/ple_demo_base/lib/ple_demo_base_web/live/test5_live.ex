defmodule PleDemoBaseWeb.Test5Live do

  use PleDemoBaseWeb, :live_view
  use Phoenix.LiveEditableView

  # ----- lifecycle callbacks -----

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def handle_params(_params, _url, socket) do
    {:noreply, socket}
  end

  # ----- event handlers -----

  # ----- view helpers -----

end
