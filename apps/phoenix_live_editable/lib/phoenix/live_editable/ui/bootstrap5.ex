defmodule Phoenix.LiveEditable.Ui.Bootstrap5 do

  @moduledoc """
  TBD
  """

  alias Phoenix.LiveEditable.Ui

  require Phoenix.LiveEditable.Svg 
  alias Phoenix.LiveEditable.Svg

  @behaviour Ui.Base

  @doc """
  <%= live_edit(assigns, @register.name, type: "text", id: "name", on_submit: "rename") %>
  """
  @impl Ui.Base
  def form_text(label, opts) do
    """
    <form class="form-inline" phx-change="#{opts[:on_change]}" phx-submit="#{opts[:on_submit]}">
    <div class="mb-2 form-group">
      <input type="text" class="form-control" name="editable_text" value="#{label}">
    </div>
    <button class="btn btn-primary mb2 btn-ple" style='margin-left: 5px' type='submit'>
      #{ Svg.inline("SquareOk") } 
    </button>
    <button class="btn btn-secondary mb2 btn-ple" style='margin-left: 5px' phx-click='cancel'>
      #{ Svg.inline("SquareCancel") } 
    </button>
    </form>
    """
  end

  @doc """
  Options is a list of tuples {<id>, <label>}
  <%= live_edit(assigns, @folder.name, type: "select", options: @folders, id: "folder", on_submit: "refolder") %>
  """
  @impl Ui.Base
  def form_select(label, opts) do
    Keyword.has_key?(opts, :options) || raise("Needs `:options` option")
    options = Enum.map(opts[:options], &("<option value='#{elem(&1,0)}'>#{elem(&1,1)}</option>"))
    """
    <form class="form-inline" phx-submit="#{opts[:on_submit]}">
    <div class="form-group col-md-6">
      <select name="editable_select" class="form-control" value="#{label}">
      #{Enum.join(options, "")}
      </select>
    </div>
    <button class="btn btn-primary mb2 btn-ple" style='margin-left: 5px' type='submit'>
      #{ Svg.inline("SquareOk") } 
    </button>
    <button class="btn btn-secondary mb2 btn-ple" style='margin-left: 5px' phx-click='cancel'>
      #{ Svg.inline("SquareCancel") } 
    </button>
    </form>
    """
  end
end
