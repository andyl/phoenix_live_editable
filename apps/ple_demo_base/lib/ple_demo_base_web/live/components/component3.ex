defmodule PleDemoBaseWeb.Components.Component3 do
  import Phoenix.LiveView

  use Phoenix.LiveComponent

  # ----- lifecycle events -----

  def mount(socket) do
    {:ok, socket}
  end

  def update(assigns, socket) do
    IO.inspect(assigns, label: "JJJJJJ")
    {:ok, assign(socket, id: assigns[:id], data: "UPDATE #{time_now()}")}
  end

  def render(%{type: "text", mode: "anchor"} = assigns) do
    ~H"""
    <span style="cursor: pointer; border-bottom: 1px dashed blue;" phx-click='focus' state='base' target={@myself} id={@id}>
      <%= @data %>
    </span>
    """
  end

  def render(%{type: "text", mode: "focus"} = assigns) do
    IO.inspect(assigns, label: "UNDERSTANDXXX")
    tgt = if assigns[:scope] == "component", do: assigns[:myself], else: nil
    ~H"""
    <form phx-submit={@submit} style="display: inline;" id={@id}>
      <input style="width: 200px;" type="text" name="data" target={tgt} value={@data} id={@id}>
        <button class="button" style='margin-left: 5px' target={@myself} type='submit'>
          OK
        </button>
        <button class="button" style='margin-left: 5px' phx-click='cancel'>
          CANCEL
        </button>
      </form>
    """
  end

  def render(assigns) do
    IO.inspect(assigns, label: "RENDER_DEFAULT")
    ~H"""
    <span style="cursor: pointer; border-bottom: 1px dashed blue;" phx-click='focus' phx-target={@myself} id={@id}>
      <%= @data %>
    </span>
    """
  end

  # ----- helpers -----

  def time_now do
    DateTime.utc_now() |> Calendar.strftime("%H:%M:%S")
  end
  # ----- event handlers -----

  def handle_event("focus", _data, socket) do
    IO.puts "COMPONENT1 FOCUS"
    new_socket = assign(socket, :data, "FOCUS #{time_now()}")
    {:noreply, new_socket}
  end

  # def handle_event("cancel", _payload, socket) do
  #   IO.puts "COMPONENT1 CANCEL"
  #   {:noreply, assign(socket, :focusid, "NONE")}
  # end
  #
  # def handle_event("update", _payload, socket) do
  #   IO.puts "COMPONENT1 UPDATE"
  #   {:noreply, assign(socket, :focusid, "NONE")}
  # end

end
