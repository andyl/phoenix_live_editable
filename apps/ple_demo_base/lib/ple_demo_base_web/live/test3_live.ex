defmodule PleDemoBaseWeb.Test3Live do

  use PleDemoBaseWeb, :live_view

  import PleDemoBase.Components

  # ----- lifecycle callbacks -----

  def mount(_params, _session, socket) do
    {:ok, assign(socket, data1: "DATA1", data2: "DATA2")}
  end

  def handle_params(_params, _url, socket) do
    {:noreply, socket}
  end

  # ----- event handlers -----

  def handle_event("focus1", data, socket) do
    IO.puts "FOCUS1"
    IO.inspect data, label: "FOCUS1"
    {:noreply, assign(socket, data1: "XXX1")}
  end

  def handle_event("focus2", data, socket) do
    IO.puts "FOCUS2"
    IO.inspect data, label: "FOCUS2"
    {:noreply, assign(socket, data2: "XXX2")}
  end

  def handle_event(target, data, socket) do
    IO.puts "UNKNOWN"
    IO.inspect target, label: "UNKNOWN"
    IO.inspect data, label: "UNKNOWN"
    {:noreply, socket}
  end
end
