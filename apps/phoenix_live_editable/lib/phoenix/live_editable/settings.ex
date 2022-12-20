defmodule Phoenix.LiveEditable.Settings do
  @moduledoc """
  Configuration settings for a LiveEditable component.

  | FIELD              | DESCRIPTION                                |
  | id                 | component id                               |
  | phx_change         | change target                              |
  | phx_submit         | submit target                              |
  | phx_target         | event target pid                           |
  | ple_config_appname | appname - for looking up config settings   |
  | ple_config_store   | storage for misc config attributes         |
  | ple_render_data    | editable data - can be nil                 |
  | ple_render_mode    | render mode: <anchor / focus>              |
  | ple_render_module  | renderer module                            |
  | ple_render_options | options for select, multi-select and radio |
  | ple_render_style   | display style: <inline / popup>            |
  | ple_render_type    | form type: <text / select / radio / ...>   |

  """

  defstruct [
    id: nil,
    phx_change: nil,
    phx_submit: "ple-default-save",
    phx_target: nil,
    ple_config_appname: nil,
    ple_config_store: %{},
    ple_render_data: nil,
    ple_render_mode: "anchor",
    ple_render_module: Phoenix.Editable.Renderer.Tailwind3,
    ple_render_options: %{},
    ple_render_style: "inline",
    ple_render_type: "text",
  ]

  alias Phoenix.LiveEditable.Settings

  @doc """
  Generate a new Settings map
  """
  def new(opts) when is_map(opts) do
    %Settings{}
    |> Map.from_struct()
    |> merge(opts)
  end

  def new(list) when is_list(list) do
    list
    |> Enum.into(%{})
    |> new()
  end

  def new, do: new(%{})

  @doc """
  Put a key/val into a Settings map
  """
  def put(settings, key, val) do
    settings
    |> merge(%{key => val})
  end

  @doc """
  Merge a map into a Settings map
  """
  def merge(%Settings{} = settings, opts) do
    settings
    |> Map.from_struct()
    |> merge(opts)
  end

  def merge(settings, opts) do
    settings
    |> Map.merge(opts)
    |> valid_keys()
  end

  @doc """
  Generate a new Settings map from a socket.

  With the socket, we use `live_editable` settings in the application config.
  """
  def new_from_socket(socket) do
    socket
    |> env_settings()
    |> new()
  end

  # --------------------------------------------------------

  defp appname(socket) do
    socket.endpoint
    |> Atom.to_string()
    |> String.replace("Web.Endpoint", "")
    |> String.replace("Elixir.", "")
    |> Macro.underscore()
    |> String.to_atom()
  end

  defp env_settings(socket) do
    socket
    |> appname()
    |> Application.fetch_env(socket.endpoint)
    |> elem(1)
    |> Keyword.get(:live_editable)
  end

  defp valid_keys(map) do
    map
    |> Enum.reject(fn({k,_}) -> invalid_key?(k) end)
    |> Enum.into(%{})
  end

  defp invalid_key?(key) do
    %Phoenix.LiveEditable.Settings{}
    |> Map.from_struct()
    |> Map.keys()
    |> Enum.all?(&(key != &1))
  end

end
