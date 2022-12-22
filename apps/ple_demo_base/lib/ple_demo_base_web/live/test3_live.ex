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

  # ----- message handlers -----

  def handle_info({"text-submit", data}, socket) do
    id = data["id"] |> String.to_atom()
    # IO.puts "<<<<< LiveEditable TEXT-SUBMIT Message Start >>>>>"
    # IO.inspect(data, label: "DATA")
    # IO.inspect(socket, label: "SOCKET")
    # IO.puts "<<<<< LiveEditable TEXT-SUBMIT Message End >>>>>"
    {:noreply, assign(socket, id, data["data"])}
  end

  def handle_info(message, socket) do
    IO.puts "<<<<< LiveEditable Unhandled Message Start >>>>>"
    IO.inspect(message, label: "MESSAGE")
    IO.puts "<<<<< LiveEditable Unhandled Message End >>>>>"
    {:noreply, socket}
  end

end
