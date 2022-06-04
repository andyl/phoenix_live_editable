defmodule PleDemoBaseWeb.Test1Live do

  use PleDemoBaseWeb, :live_view
  use Phoenix.LiveEditable

  # ----- lifecycle callbacks -----

  def mount(_params, _session, socket) do
    data = %{
      "id1" => "MyData1",
      "id2" => "MyData2",
      "id3" => "MyData3",
      "id4" => "MyData4"
    }
    {:ok, assign(socket, :data, data)}
  end

  def handle_params(_params, _url, socket) do
    {:noreply, socket}
  end

  # ----- event handlers -----

  def handle_event("save", %{"data" => data}, socket) do
    IO.inspect(socket, label: "SAVESOCK -->")
    IO.inspect(data, label: "SAVEDATA -->")
    id = socket.assigns.focusid
    newdata = socket.assigns.data |> Map.merge(%{id => data})
    new_socket = assign(socket, data: newdata, focusid: "NONE")
    {:noreply, new_socket}
  end

  # ----- helpers -----

end
