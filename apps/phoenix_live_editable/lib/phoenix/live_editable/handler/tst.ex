defmodule Phoenix.LiveEditable.Handler.Tst do

  def handle_event("ple-focus", data, socket) do
    IO.puts "Handler.Tst"
    IO.inspect("ple-focus")
    IO.inspect(data)
    {:noreply, socket}
  end

end
