defmodule Phoenix.LiveEditable.Milligram do
  alias Phoenix.LiveEditable

  @behaviour LiveEditable.Base

  def form_text(label, opts) do
    """
    <form phx-change="#{opts[:on_change]}" phx-submit="#{opts[:on_submit]}">
      <input type="text" name="editable_text" value="#{label}">
      <button type='submit'><i class='fa fa-check-square'></i></button>
      <button phx-click='cancel'><i class='fa fa-window-close'></i></button>
    </form>
    """
  end

  def form_select(label, opts) do
    Keyword.has_key?(opts, :options) || raise("Needs `:options` option")

    options =
      Enum.map(
        opts[:options],
        &"<option value='#{elem(&1, 0)}'>#{elem(&1, 1)}</option>"
      )

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
