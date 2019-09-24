defmodule LiveEditable.Bootstrap4 do

  @behaviour LiveEditable.Base

  def form_text(label, opts) do
    """
    <form class="form-inline" phx-change="#{opts[:on_change]}" phx-submit="#{opts[:on_submit]}">
    <div class="form-group mb-2">
      <input type="text" class="form-control-plaintext" name="editable_text" value="#{label}">
    </div>
      <button class="btn btn-primary mb2" type='submit'><i class='fa fa-check-square'></i></button>
      <button class="btn btn-secondary mb2" phx-click='cancel'><i class='fa fa-window-close'></i></button>
    </form>
    """
  end

  def form_select(label, opts) do
    Keyword.has_key?(opts, :options) || raise("Needs `:options` option")
    options = Enum.map(opts[:options], &("<option value='#{elem(&1,0)}'>#{elem(&1,1)}</option>"))
    """
    <form phx-submit="#{opts[:on_submit]}" id="#{opts[:id]}">
      <select name="editable_select" value="#{label}" form="#{opts[:id]}">
      #{Enum.join(options, "")}
      </select>
      <button type='submit'><i class='fa fa-check-square'></i></button>
      <button phx-click='cancel'><i class='fa fa-window-close'></i></button>
    </form>
    """
  end

end
