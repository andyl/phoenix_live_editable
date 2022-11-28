defmodule PleDemoTailwind3.Components do

  use Phoenix.Component

  @doc """
  Headline Component

  in the LiveView: `import PleDemoTailwind3.Components`

  in the HEEX template: `<.headline text="mytext"/>`
  """
  def headline(assigns) do
    ~H"""
    <span style="border-bottom: 1px dashed blue;">
    <%= @text %>
    </span>
    """
  end

  def test_menu(assigns) do
    ~H"""
    <div>
      <%= navbar(~w(Home Test1), assigns[:title]) %>
    </div>
    """
  end

  # ----- helpers -----

  defp navbar(items, title) do
    items
    |> Enum.map(fn(item) -> genlink(item, title) end)
    |> Enum.join(" | ")
    |> Phoenix.HTML.raw()
  end

  defp genlink(item, title) do
    case item == title do
      true -> "<b>#{title}</b>"
      false -> "<a href='#{String.downcase(item)}'>#{item}</a>"
    end
  end

end
