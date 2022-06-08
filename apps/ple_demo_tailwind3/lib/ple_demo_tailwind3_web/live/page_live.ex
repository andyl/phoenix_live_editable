defmodule PleDemoTailwind3Web.PageLive do
  use PleDemoTailwind3Web, :live_view
  use Phoenix.LiveEditable

  alias Phx.Demo.Helpers

  # ----- lifecycle callbacks -----

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(_params, url, socket) do
    {:noreply, assign(socket, :url, url)}
  end

  # ----- event handlers -----

  # ----- helpers -----

end
