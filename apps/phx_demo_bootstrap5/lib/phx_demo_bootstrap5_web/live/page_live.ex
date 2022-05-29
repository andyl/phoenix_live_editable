defmodule PhxDemoBootstrap5Web.PageLive do

  use PhxDemoBootstrap5Web, :live_view
  use Phoenix.LiveEditable

  alias Phx.Demo.Helpers
  alias PhxDemoBootstrap5Web.PageLive.PageComponent 

  # ----- lifecycle callbacks -----

  @impl true
  def mount(_params, _session, socket) do
    opts = [
      text_data: "input data", 
      select_data: "value1",
      select_opts: [
        {"v1", "value1"}, 
        {"v2", "value2"}, 
        {"v3", "value3"}
      ]
    ]
    {:ok, assign(socket, opts)}
  end

  @impl true
  def handle_params(_params, url, socket) do
    {:noreply, assign(socket, :url, url)}
  end

  # ----- event handlers -----

  # @impl true
  # def handle_event("update_ctext", %{"editable_text" => new_value}, socket) do
  #   IO.inspect new_value, label: "NEW_VALUE"
  #   {:noreply, assign(socket, text_data: new_value)}
  # end

  @impl true
  def handle_event("update_text", %{"editable_text" => new_value}, socket) do
    {:noreply, assign(socket, text_data: new_value)}
  end

  @impl true
  def handle_event("update_select", %{"editable_select" => new_value}, socket) do
    {:noreply, assign(socket, select_data: new_value)}
  end
end
