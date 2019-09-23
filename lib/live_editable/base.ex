defmodule LiveEditable.Base do
  import Phoenix.LiveView

  import Phoenix.HTML

  # ----- view helpers -----
  def live_edit(assigns, label, opts) do
    Keyword.has_key?(opts, :id) || raise("Needs `:id` option")
    Keyword.has_key?(opts, :type) || raise("Needs `:type` option ('text' | 'select')")
    id = opts[:id]
    focus = assigns[:focus]

    if id == focus do
      case opts[:type] do
        "text" -> form_text(label, opts) 
        "select" -> form_select(label, opts)
        _ -> form_text(label, opts)
      end |> raw()
    else
      raw("<span class='editable-click' phx-click='focus' phx-value-focusid='#{id}'>#{label}</span>")
    end
  end

  defp form_text(label, opts) do
    """
    <form phx-change="#{opts[:on_change]}" phx-submit="#{opts[:on_submit]}">
      <input type="text" name="editable_text" value="#{label}">
      <button type='submit'><i class='fa fa-check-square'></i></button>
      <button phx-click='cancel'><i class='fa fa-window-close'></i></button>
    </form>
    """
  end

  defp form_select(label, opts) do
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

  defmacro __using__(_opts) do
    quote do
      import LiveEditable.Base

      # ----- event handlers -----
      def handle_event("focus", %{"focusid" => focusid}, socket) do
        {:noreply, assign(socket, focus: focusid)}
      end

      def handle_event("cancel", payload, socket) do
        {:noreply, assign(socket, focus: nil)}
      end
    end
  end
end
