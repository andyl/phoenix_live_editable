defmodule Phoenix.LiveEditable.Interface.Milligram do

  require Phoenix.LiveEditable.Svg
  alias Phoenix.LiveEditable.Svg

  import Phoenix.HTML

  use Phoenix.Component

  def render(%{type: "text", mode: "anchor"} = assigns) do
    tgt = if assigns[:scope] == "component", do: assigns[:myself], else: nil
    ~H"""
    <span style="cursor: pointer; border-bottom: 1px dashed blue;" target={tgt} phx-click='focus' target={@myself} phx-value-id={@id} focusid={@focusid}>
      <%= @data %>
    </span>
    """
  end

  def render(%{type: "text", mode: "focus"} = assigns) do
    IO.inspect(assigns, label: "UNDERSTANDXXX")
    # stateful has a component target
    tgt = if assigns[:scope] == "component", do: assigns[:myself], else: nil
    ~H"""
    <form phx-submit={@submit} style="display: inline;">
      <input style="width: 200px;" type="text" name="data" target={tgt} value={@data}>
      <button class="button" style='margin-left: 5px' target={@myself} type='submit'>
      <%= raw Svg.inline("CircleOk") %>
    </button>
    <button class="button" style='margin-left: 5px' phx-click='cancel'>
      <%= raw Svg.inline("CircleCancel") %>
    </button>
    </form>
    """
  end

  def render(%{type: "select", mode: "focus"} = assigns) do
    ~H"""
    [ RENDERSEL - type: select, mode: focus ]
    """
  end

end
