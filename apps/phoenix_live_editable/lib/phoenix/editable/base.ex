defmodule Phoenix.Editable.Base do
  use Phoenix.LiveComponent

  alias Phoenix.LiveEditable.Settings

  @moduledoc """
  Base LiveComponent used for all live-editable data types.
  """

  # ----- lifecycle callbacks -----

  def mount(socket) do
    {:ok, socket}
  end

  def update(assigns, socket) do
    normassigns = normalize(assigns)
    new_assigns = socket
                  |> Settings.new_from_socket()
                  |> Settings.merge(normassigns)

    {:ok, assign(socket, new_assigns)}
  end

  def render(assigns) do
    module = assigns.ple_module
    module.render(assigns)
  end

  # ----- event handlers -----

  def handle_event("ple-blur", _data, socket) do
    {:noreply, assign(socket, :ple_mode, "anchor")}
  end

  def handle_event("ple-focus", data, socket) do
    IO.puts "BASE"
    IO.inspect("ple-focus", label: "RANGERBASE")
    IO.inspect(data, label: "KIAZBASE")
    {:noreply, assign(socket, :ple_mode, "focus")}
  end

  def handle_event("ple-default-save", data, socket) do
    {:noreply, assign(socket, ple_data: data["data"], ple_mode: "anchor")}
  end

  def handle_event(target, data, socket) do
    IO.puts "BASE"
    IO.inspect(target, label: "RANGERBASE")
    IO.inspect(data, label: "KIAZBASE")
    {:noreply, socket}
  end

  # ----- view helpers -----

  defp normalize(map) do
    map
    |> atomify_keys()
  end

  defp atomify_keys(map) do
    map
    |> Enum.reduce(%{}, fn {k, v}, acc -> Map.put(acc, atomify(k), v) end)
  end

  defp atomify(key) when is_binary(key) do
    key
    |> String.to_atom()
  end

  defp atomify(key) when is_atom(key) do
    key
    |> Atom.to_string()
    |> atomify()
  end

  defp atomify(key) do
    key
  end

end
