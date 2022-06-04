defmodule Phoenix.LiveEditableHooks do

  import Phoenix.LiveView

  # TODO:
  # - grab the endpoint from the session
  # - set interface from config
  def on_mount(:default, _params, _session, socket) do
    new_socket = assign(socket, :focusid, "<NONE>")
    {:cont, new_socket}
  end

end
