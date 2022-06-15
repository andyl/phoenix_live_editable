defmodule PleDemoBaseWeb.Test4Live do

  use PleDemoBaseWeb, :live_view
  use Phoenix.LiveEditableView
  import PleDemoBase.Components

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

end
