defmodule Phoenix.LvEditableHandler do
  @moduledoc """
  Support for LiveEditable Event Handlers

      defmodule MyEditableHandler do
        use Phoenix.LvEditable.Handler

        # --- DO NOT DEFINE LIFECYCLE CALLBACKS!!! (mount, update, render)
        # --- DO NOT DEFINE VIEW HELPERS!!!
        # --- DO DEFINE EVENT HANDLERS!!!

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

  # ----- livecycle callback helpers

  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <span style={ple_linkstyle()} phx-click="ple-focus" phx-target={@myself} id={@id}>
      <%= @data %>
    </span>
    """
  end

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

      on_mount(Phoenix.LvEditableHooks)

      alias Phoenix.LvEditableHandler, as: Helper

      # ----- USING lifecycle callbacks -----

      def mount(socket) do
        {:ok, socket}
      end

      def update(assigns, socket) do
        attrs = [
          id: assigns[:id],
          data: "UPDATE #{Helper.ple_time_now()}"
        ]

        {:ok, assign(socket, attrs)}
      end

      def render(assigns) do
        Phoenix.LvEditableHandler.render(assigns)
      end

      # ----- USING event handlers -----

      def handle_event("ple-blur", %{"id" => id}, socket) do
        IO.puts("COMPONENT1 FOCUS")
        new_socket = assign(socket, :focusid, id)
        {:noreply, new_socket}
      end

      def handle_event("ple-focus", _data, socket) do
        data = "NEWDATA #{Helper.ple_time_now()}"
        {:noreply, assign(socket, :data, data)}
      end

      # def handle_event(_all, _data, socket) do
      #   IO.puts "DEFAULT HANDLER"
      #   {:noreply, socket}
      # end
    end
  end

end
