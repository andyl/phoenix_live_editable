defmodule Phoenix.LiveEditable.Settings do
  @moduledoc """
  Configuration settings for the LiveEditable.Base component.

  | SETTING           | ATTRIBUTES                                                                   |
  |-------------------|------------------------------------------------------------------------------|
  | [Config](#config) | `ple_id`, `ple_store`                                                        |
  | [Events](#events) | `ple_submit`, `ple_change`, `ple_target`                                     |
  | [Render](#render) | `ple_data`, `ple_mode`, `ple_module`, `ple_module`,  `ple_style`, `ple_type` |

  ## Config

  Content TBD

  ## Events

  Content TBD

  ## Render

  Content TBD

  """

  defstruct [
    # config
    ple_id: nil,
    ple_store: %{},
    # events
    ple_change: nil,
    ple_submit: "ple-default-save",
    ple_target: nil,
    # render
    ple_data: nil,
    ple_mode: "anchor",
    ple_module: Phoenix.Editable.Renderer.Tailwind3,
    ple_options: %{},
    ple_style: "inline",
    ple_type: "text",
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
