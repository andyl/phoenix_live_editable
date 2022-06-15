defmodule Phoenix.LiveEditableView do

  @moduledoc """
  View-Level LiveEditable Utiltities

      defmodule MyView do
        use MyAppWeb, :live_view
        use Phoenix.LiveEditableView

        ...

      end

  Layered configuration:
  - hardcoded default -> config -> view -> tag -> handler
  - values can be overridden

  """

  # ----- hook -----

  import Phoenix.LiveEditable.ViewCache

  def on_mount(:default, _params, _session, socket) do
    # setup a ViewCache and load config data
    vc_new(socket)
    vc_putval(socket, :ple_appname, appname(socket))
    vc_putval(socket, :ple_viewpid, self())
    vc_merge(socket, ple_config_map(socket))

    {:cont, socket}
  end

  # ----- hook helpers -----

  defp appname(socket) do
    socket.endpoint
    |> Atom.to_string()
    |> String.replace("Web.Endpoint", "")
    |> String.replace("Elixir.", "")
    |> Macro.underscore()
    |> String.to_atom()
  end

  defp ple_config_map(socket) do
    endpoint = socket.endpoint
    socket
    |> appname()
    |> Application.fetch_env(endpoint)
    |> elem(1)
    |> Keyword.get(:live_editable)
    |> Enum.reject(fn({k,_}) -> ple_invalid_key?(k) end)
    |> Enum.into(%{})
  end

  defp ple_invalid_key?(key) do
    %Phoenix.LiveEditable.ViewCache{}
    |> Map.from_struct()
    |> Map.keys()
    |> Enum.all?(&(key == &1))
  end

  # ----- use macro -----

  defmacro __using__(_opts) do
    quote do

      on_mount Phoenix.LiveEditableView

      import Phoenix.LiveEditable.Helpers

    end
  end
end
