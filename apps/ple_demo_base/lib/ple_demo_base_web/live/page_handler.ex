defmodule PleDemoBaseWeb.PageHandler do

  use Phoenix.LiveEditableComponent

  # ----- event handlers -----

  def handle_event("save-view", data, socket) do

    # send message to view
    socket
    |> Map.get(:assigns)
    |> Map.get(:ple_viewpid)
    |> send({:viewupdate, data})

    {:noreply, assign(socket, :ple_mode, "anchor")}
  end
end
