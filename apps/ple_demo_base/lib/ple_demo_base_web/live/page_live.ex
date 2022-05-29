defmodule PleDemoBaseWeb.PageLive do
  use PleDemoBaseWeb, :live_view
  use Phoenix.LiveEditable

  alias Phx.Demo.Helpers

  # ----- lifecycle callbacks -----

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", results: %{})}
  end

  @impl true
  def handle_params(_params, url, socket) do
    {:noreply, assign(socket, :url, url)}
  end

  # ----- event handlers -----

  # @impl true
  # def handle_event("suggest", %{"q" => query}, socket) do
  #   {:noreply, assign(socket, results: search(query), query: query)}
  # end

  # @impl true
  # def handle_event("search", %{"q" => query}, socket) do
  #   case search(query) do
  #     %{^query => vsn} ->
  #       {:noreply, redirect(socket, external: "https://hexdocs.pm/#{query}/#{vsn}")}
  #
  #     _ ->
  #       {:noreply,
  #        socket
  #        |> put_flash(:error, "No dependencies found matching \"#{query}\"")
  #        |> assign(results: %{}, query: query)}
  #   end
  # end

  @impl true
  def handle_event("update", args, socket) do
    IO.inspect args, label: "args"
    {:noreply, socket}
  end

  # ----- helpers -----

  # defp search(query) do
  #   if not LiveEditableWeb.Endpoint.config(:code_reloader) do
  #     raise "action disabled when not in development"
  #   end
  #
  #   for {app, desc, vsn} <- Application.started_applications(),
  #       app = to_string(app),
  #       String.starts_with?(app, query) and not List.starts_with?(desc, ~c"ERTS"),
  #       into: %{},
  #       do: {app, vsn}
  # end

end
