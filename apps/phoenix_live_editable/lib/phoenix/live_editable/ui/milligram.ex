defmodule Phoenix.LiveEditable.Ui.Milligram do

  alias Phoenix.LiveEditable.Ui
  require Phoenix.LiveEditable.Svg 
  alias Phoenix.LiveEditable.Svg

  @behaviour Ui.Base

  @impl Ui.Base
  def form_text(label, opts) do
    IO.puts "MILLIGRAMMMM"
    """
    <form class="ple-mg-form" phx-change="#{opts[:on_change]}" phx-submit="#{opts[:on_submit]}">
    <input class="ple-mg-text" type="text" name="editable_text" value="#{label}">
    <button class="button btn-mg-ple btn-ple-primary" style='margin-left: 5px' type='submit'>
      #{ Svg.inline("CircleOk") } 
    </button>
    <button class="button btn-mg-ple btn-ple-secondary" style='margin-left: 5px' phx-click='cancel'>
      #{ Svg.inline("CircleCancel") } 
    </button>
    </form>
    """
  end

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
