defmodule Phoenix.LiveEditable.Interface.Milligram do

  require Phoenix.LiveEditable.Svg
  alias Phoenix.LiveEditable.Svg

  import Phoenix.HTML

  use Phoenix.Component

  def render(%{ple_type: "text", ple_mode: "anchor", ple_data: nil} = assigns) do
    ~H"""
    <span style="cursor: pointer; border-bottom: 1px dashed blue;" phx-click='ple-focus' phx-target={@myself}>
      <span style="color: red; font-style: italic;">Empty</span>
    </span>
    """
  end

  def render(%{ple_type: "text", ple_mode: "anchor"} = assigns) do
    ~H"""
      <span style="cursor: pointer; border-bottom: 1px dashed blue;" phx-click='ple-focus' phx-target={@myself}>
        <%= @ple_data %>
      </span>
    """
  end

  def render(%{ple_type: "text", ple_mode: "focus"} = assigns) do
    ~H"""
      <div>
        <form style="display: inline;" phx-submit={@ple_action} phx-target={@myself} phx-click-away='ple-blur'>
          <input style="width: 200px;" type="text" name="data" target={@myself} value={@ple_data}/>
          <button class="button" style='margin-left: 5px' type='submit'>
            <%= raw Svg.inline("CircleOk") %>
          </button>
        </form>
        <button class="button" style='margin-left: 5px'>
          <%= raw Svg.inline("CircleCancel") %>
        </button>
      </div>
    """
  end

  def render(%{type: "select", mode: "focus"} = assigns) do
    ~H"""
      [ RENDERSEL - type: select, mode: focus ]
    """
  end

end
