defmodule Phoenix.LiveEditable do
  import Phoenix.LiveView
  import Phoenix.HTML

  # ----- view helpers -----
  def live_edit(assigns, label, opts) do
    Keyword.has_key?(opts, :id) || raise("Needs `:id` option")
    Keyword.has_key?(opts, :type) || raise("Needs `:type` option ('text' | 'select')")
    id = opts[:id]
    focus = assigns[:focus]

    if id == focus do

      module = css_framework_module()

      case opts[:type] do
        "text" -> module.form_text(label, opts)
        "select" -> module.form_select(label, opts)
        _ -> module.form_text(label, opts)
      end 
      |> raw()
    else
      "<span class='editable-click' phx-click='focus' phx-value-focusid='#{id}'>#{label}</span>"
      |> raw()
    end
  end

  defp css_framework_module do
    lbl = case Application.fetch_env(:live_editable, :css_framework) do
      {:ok, el} when is_atom(el) -> el |> Atom.to_string() |> String.upcase()
      {:ok, el} when is_binary(el) -> el |> String.upcase()
      _ -> :error
    end

    case lbl do
      "BOOTSTRAP4" -> LiveEditable.Bootstrap4
      "BOOTSTRAP" -> LiveEditable.Bootstrap4
      "MILLIGRAM" -> LiveEditable.Milligram
      _ -> LiveEditable.Bootstrap4
    end
  end

  defmacro __using__(_opts) do
    quote do
      import LiveEditable

      def handle_event("focus", %{"focusid" => focusid}, socket) do
        {:noreply, assign(socket, focus: focusid)}
      end

      def handle_event("cancel", payload, socket) do
        {:noreply, assign(socket, focus: nil)}
      end
    end
  end
end
