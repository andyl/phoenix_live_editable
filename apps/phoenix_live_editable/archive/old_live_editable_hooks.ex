defmodule Phoenix.OldLiveEditableHooks do

  import Phoenix.LiveView

  def on_mount(:default, _params, _session, socket) do

    new_socket =
      socket
      |> assign(:focusid, "<NONE>")
      |> assign(:endpoint, endpoint_module(socket))
      |> assign(:interface, interface_module(socket))

    {:cont, new_socket}
  end

  defp app_name(socket) do
    socket.endpoint
    |> Atom.to_string()
    |> String.replace("Web.Endpoint", "")
    |> String.replace("Elixir.", "")
    |> Macro.underscore()
    |> String.to_atom()
  end

  defp endpoint_module(socket) do
    socket.endpoint
  end

  defp interface_module(socket) do
    socket
    |> app_name()
    |> Application.fetch_env(socket.endpoint)
    |> elem(1)
    |> Keyword.get(:live_editable)
    |> Keyword.get(:interface)
  end

end
