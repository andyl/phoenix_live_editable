defmodule Phoenix.LiveEditable.ViewCache do

  @moduledoc """
  ViewCache

  What it does:
  - starts an agent, attached to the socket
  - when the socket dies, the ViewCache is wiped out

  Purpose:
  - to cache config data
  - fast and simple config storage

  Rationale:
  - minimize the number of params in a HEEX tag
  - can only use string and numeric values in HEEX assigns - not lists, maps etc.

  Notes:
  - depends on Phoenix.LiveEditable.Registry
  - start the application to run in iex: `iex -S mix`

  Usage:

      import Phoenix.LiveEditable.ViewCache
      vc_new(name)

  """

  defstruct [
    # editable data - can be nil
    ple_data: nil,
    # form type: <text | select | multi-select | radio | ...>
    ple_type: "text",
    # render mode: <anchor | focus>
    ple_mode: "anchor",
    # display style: <inline | popup>
    ple_style: "inline",
    # storage for misc config attributes
    ple_store: %{},
    # submit action: anything
    ple_action: "ple-default-save",
    # appname: for looking up config settings
    ple_appname: nil,
    # target: pid of view
    ple_viewpid: nil,
    # data source: place where state is managed <component | view>
    ple_datasrc: "component",
    # handler module - can reset in view or tag
    ple_handler: Phoenix.LiveEditable.ComponentHandler.Default,
    # interface module: see Phoenix.LiveEditable.Interface.*
    ple_interface: Phoenix.LiveEditable.Interface.Milligram,
  ]

  @doc """
  vc_new

  Generate a new ViewCache populated with a ViewCache struct.

  This cache is meant to be view-specific, started when the view is created,
  and killed when the view process is destroyed.
  """
  def vc_new(name) when is_binary(name) do
    initial_value = %Phoenix.LiveEditable.ViewCache{}
    vianame = vianame(name)
    Agent.start_link(fn() -> initial_value end, name: vianame)
    name
  end

  def vc_new(socket) do
    socket.id |> vc_new()
  end

  def vc_get(name) when is_binary(name) do
    vianame = vianame(name)
    Agent.get(vianame, &(&1))
  end

  def vc_get(socket) do
    socket.id |> vc_get()
  end

  def vc_get(name, key) when is_binary(name) do
    vc_get(name)
    |> Map.get(key)
  end

  def vc_get(socket, key) do
    socket.id |> vc_get(key)
  end

  def vc_put(name, key, data) when is_binary(name) do
    vianame = vianame(name)
    Agent.update(vianame, &(Map.put(&1, key, data)))
  end

  def vc_put(socket, key, data) do
    socket.id |> vc_put(key, data)
  end

  def vc_putval(name, key, data) when is_binary(name) do
    unless data == nil do
      vc_put(name, key, data)
    end
  end

  def vc_putval(socket, key, data) do
    unless data == nil do
      vc_put(socket, key, data)
    end
  end

  def vc_merge(name, map) when is_binary(name) do
    newmap = name |> vc_get() |> Map.merge(map)
    vianame = vianame(name)
    Agent.update(vianame, fn(_) -> newmap end)
  end

  def vc_merge(socket, map) do
    socket.id |> vc_merge(map)
  end

  def vc_mergeval(name, map) when is_binary(name) do
    vc_merge(name, strip_nils(map))
  end

  def vc_mergeval(socket, map) do
    socket.id |> vc_mergeval(map)
  end

  # --------------------------------------------------------

  defp vianame(name) do
    {:via, Registry, {Phoenix.LiveEditable.Registry, name}}
  end

  defp strip_nils(%_{} = struct) do
    struct
    |> Map.from_struct()
    |> strip_nils()
  end

  defp strip_nils(map) when is_map(map) do
    map
    |> Enum.reject(fn({_, v}) -> is_nil(v) end)
    |> Map.new()
  end

end
