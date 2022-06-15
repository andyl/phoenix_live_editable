defmodule Phoenix.LiveEditableComponent do
  @moduledoc """
  Support for LiveEditable Component Event Handlers

      defmodule MyEditableHandler do
        use Phoenix.LiveEditable.Component

        # --- DO NOT DEFINE LIFECYCLE CALLBACKS!!! (mount, update, render)
        # --- DO NOT DEFINE VIEW HELPERS!!!

        # --- on_mount (OPTIONAL) ---

        def on_mount(assigns) do
          # override the default assigns ...
          {:ok, new_assigns}
        end

        # --- event handlers ---

        def handle_event("focus", %{"id" => id}, socket) do
          new_socket = assign(socket, :focusid, id)
          {:noreply, new_socket}
        end

      end
  """

  # ----- view helpers -----

  def ple_time_now do
    DateTime.utc_now() |> Calendar.strftime("%H:%M:%S")
  end

  def ple_linkstyle do
    "cursor: pointer; border-bottom: 1px dashed blue;"
  end

  # ----- USING macro -----

  defmacro __using__(_opts) do
    quote do
      use Phoenix.LiveComponent

      alias Phoenix.LiveEditableComponent, as: Helper

      # ----- USING lifecycle callbacks -----

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

      # ----- USING event handlers -----

      def handle_event("ple-blur", data, socket) do
        {:noreply, assign(socket, :ple_mode, "anchor")}
      end

      def handle_event("ple-focus", data, socket) do
        {:noreply, assign(socket, :ple_mode, "focus")}
      end

      def handle_event("ple-default-save", data, socket) do
        {:noreply, assign(socket, ple_data: data["data"], ple_mode: "anchor")}
      end

      # ----- USING view helpers -----

      import Phoenix.LiveEditable.ViewCache

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
        assigns
        |> Map.get(:socketid)
        |> vc_get(:ple_interface)
      end

    end
  end

end
