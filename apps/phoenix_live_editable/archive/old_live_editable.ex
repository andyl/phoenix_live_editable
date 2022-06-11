defmodule Phoenix.OldLiveEditable do
  import Phoenix.LiveView

  use Phoenix.LiveComponent

  import Phoenix.LiveEditable.ViewCache

  # ----- lifecycle callbacks -----

  def mount(socket) do
    {:ok, socket}
  end

  def update(assigns, socket) do
    newassigns = assigns
                 |> atomify_keys
                 |> Map.put(:socketid, socket.id)
                 |> merge_cache()
                 |> Map.to_list()
    {:ok, assign(socket, newassigns)}
  end

  def render(assigns) do
    module = interface_module(assigns)
    assigns |> module.render()
  end

  # ----- event handlers -----

  # ----- view helpers -----

  defp atomify_keys(map) do
    map
    |> Enum.reduce(%{}, fn({k, v}, acc) -> Map.put(acc, atomify(k), v) end)
  end

  defp atomify(key) when is_binary(key) do
    key
    |> String.replace("ple-", "ple_")
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

  defp merge_cache(assigns) do
    assigns[:socketid]
    |> vc_get()
    |> Map.merge(assigns)
  end

  defp interface_module(assigns) do
    vc_get(assigns[:socketid], :ple_interface)
  end

  defmacro __using__(_opts) do
    quote do

      on_mount Phoenix.LiveEditableHooks

      # def handle_event("focus", %{"id" => id}, socket) do
      #   IO.puts("EVENT FOCUS (live_editable)")
      #   new_socket = assign(socket, :focusid, id)
      #   {:noreply, new_socket}
      # end
      #
      # def handle_event("cancel", _payload, socket) do
      #   IO.puts("EVENT CANCEL (live_editable)")
      #   {:noreply, assign(socket, :focusid, "NONE")}
      # end

    end
  end
end
