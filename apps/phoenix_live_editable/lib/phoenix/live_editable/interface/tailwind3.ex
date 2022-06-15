defmodule Phoenix.LiveEditable.Interface.Tailwind3 do

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

  # def text_focus(label, opts) do
  #   """
  #   <form class="ple-mg-form" phx-change="#{opts[:on_change]}" phx-submit="#{opts[:on_submit]}">
  #   <input class="ple-mg-text" type="text" name="editable_text" value="#{label}">
  #   <button class="button btn-mg-ple btn-ple-primary" style='margin-left: 5px' type='submit'>
  #     #{ Svg.inline("CircleOk") }
  #   </button>
  #   <button class="button btn-mg-ple btn-ple-secondary" style='margin-left: 5px' phx-click='cancel'>
  #     #{ Svg.inline("CircleCancel") }
  #   </button>
  #   </form>
  #   """
  # end
  #
  # @doc """
  # <%= live_edit(assigns, @register.name, type: "text", id: "name", on_submit: "rename") %>
  # """
  # @impl Interface.Base
  # def text_anchor(label, _opts) do
  #   # target = if opts[:target], do: "phx-target='#{opts[:target]}'", else: ""
  #   # change = "phx-change='#{opts[:on_change]}'"
  #   # submit = "phx-submit='#{opts[:on_submit]}'"
  #   """
  #   <span><#{ label }</span>
  #   """
  # end
  #
  # @impl Interface.Base
  # def select_focus(label, opts) do
  #   Keyword.has_key?(opts, :options) || raise("Needs `:options` option")
  #   options = Enum.map(opts[:options], &("<option value='#{elem(&1,0)}'>#{elem(&1,1)}</option>"))
  #   """
  #   <form class="form-inline" phx-submit="#{opts[:on_submit]}">
  #   <div class="form-group col-md-6">
  #     <select name="editable_select" class="form-control" value="#{label}">
  #     #{Enum.join(options, "")}
  #     </select>
  #   </div>
  #   <button class="btn btn-primary mb2 btn-ple" style='margin-left: 5px' type='submit'>
  #     #{ Svg.inline("SquareOk") }
  #   </button>
  #   <button class="btn btn-secondary mb2 btn-ple" style='margin-left: 5px' phx-click='cancel'>
  #     #{ Svg.inline("SquareCancel") }
  #   </button>
  #   </form>
  #   """
  # end
  #
  # @impl Interface.Base
  # def select_anchor(label, _opts) do
  #   # target = if opts[:target], do: "phx-target='#{opts[:target]}'", else: ""
  #   # change = "phx-change='#{opts[:on_change]}'"
  #   # submit = "phx-submit='#{opts[:on_submit]}'"
  #   """
  #   <span><#{ label }</span>
  #   """
  # end
end
