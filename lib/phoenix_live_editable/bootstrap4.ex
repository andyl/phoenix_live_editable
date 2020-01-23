defmodule Phoenix.LiveEditable.Bootstrap4 do

  alias Phoenix.LiveEditable
  require Phoenix.LiveEditable.Svg 
  alias Phoenix.LiveEditable.Svg

  @behaviour LiveEditable.Base

  @impl LiveEditable.Base
  def form_text(label, opts) do
    """
    <form class="form-inline" phx-change="#{opts[:on_change]}" phx-submit="#{opts[:on_submit]}">
    <div class="form-group mb-2">
      <input type="text" class="form-control" name="editable_text" value="#{label}">
    </div>
    <button class="btn btn-primary mb2" style='margin-left: 5px' type='submit'>
    #{ Svg.inline("BootstrapOk") } 
    </button>
    <button class="btn btn-secondary mb2" style='margin-left: 5px' phx-click='cancel'>
    #{ Svg.inline("BootstrapCancel") } 
    </button>
    </form>
    """
  end

  @impl LiveEditable.Base
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
    <button class="btn btn-primary mb2" style='margin-left: 5px' type='submit'>
      #{ Svg.inline("BootstrapOk") } 
    </button>
    <button class="btn btn-secondary mb2" style='margin-left: 5px' phx-click='cancel'>
      #{ Svg.inline("BootstrapCancel") } 
    </button>
    </form>
    """
  end
end
