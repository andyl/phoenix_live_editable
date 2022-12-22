defmodule Phoenix.LiveEditable.Settings do
  @moduledoc """
  Configuration settings for the LiveEditable.Base component.

  | SETTING               | ATTRIBUTES                                        |
  |-----------------------|---------------------------------------------------|
  | [Config](#config)     | `id`, `ple_store`                                 |
  | [Render](#render)     | `ple_mode`, `ple_module`, `ple_style`, `ple_type` |
  | [Data](#data)         | `ple_data`, `ple_changeset`, `ple_options`        |
  | [Messages](#messages) | `ple_submit`, `ple_change`                        |

  ## Config

  Content TBD

  ## Render

  Content TBD

  ## Data

  Content TBD

  ## Messages

  Content TBD

  """

  defstruct [
    # config
    id: nil,
    ple_store: %{},
    # render
    ple_mode: "anchor",
    ple_module: Phoenix.Editable.Renderer.Tailwind3,
    ple_style: "inline",
    ple_type: "text",
    # data
    ple_data: nil,
    ple_changeset: nil,
    ple_options: %{},
    # messages
    ple_submit: nil,
    ple_change: nil,
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
