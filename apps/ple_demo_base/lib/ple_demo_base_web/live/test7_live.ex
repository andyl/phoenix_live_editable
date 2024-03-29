defmodule PleDemoBaseWeb.Test7Live do

  @moduledoc """
  A demo page that shows various LiveEditable components.
  """

  use PleDemoBaseWeb, :live_view
  use Phoenix.LiveEditable.ViewUtil

  import PleDemoBase.Components

  # ----- lifecycle callbacks -----

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :viewdata, "CLICK ME TO EDIT")}
  end

  def handle_params(_params, _url, socket) do
    {:noreply, socket}
  end

  # ----- event handlers -----

  # def handle_event(_tag, _data, socket) do
  #   {:noreply, socket}
  # end
  #
  # def handle_info({:viewupdate, %{"data" => newdata}}, socket) do
  #   {:noreply, assign(socket, :viewdata, newdata)}
  # end

  # ----- view helpers -----

end
