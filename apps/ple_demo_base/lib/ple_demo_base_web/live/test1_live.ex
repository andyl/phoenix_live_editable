defmodule PleDemoBaseWeb.Test1Live do

  use PleDemoBaseWeb, :live_view

  import PleDemoBase.Components

  # ----- lifecycle callbacks -----

  def mount(_params, _session, socket) do
    data1 = %{
      "id1" => "MyData1",
      "id2" => "MyData2",
      "id3" => "MyData3",
      "id4" => "MyData4"
    }
    data2 = %{
      "xd1" => "MyData1",
      "xd2" => "MyData2",
      "xd3" => "MyData3",
      "xd4" => "MyData4"
    }
    {:ok, assign(socket, data1: data1, data2: data2)}
  end

  def handle_params(_params, _url, socket) do
    {:noreply, socket}
  end

  # ----- event handlers -----

  def handle_event(target, data, socket) do
    IO.puts "TEST1LIVE"
    IO.inspect(target, label: "TARGET")
    IO.inspect(data, label: "DATA")
    data = %{
      "id1" => "MyDataA",
      "id2" => "MyData2",
      "id3" => "MyData3",
      "id4" => "MyData4"
    }
    newsock = assign(socket, :data, data)
    {:noreply, newsock}
  end

end
