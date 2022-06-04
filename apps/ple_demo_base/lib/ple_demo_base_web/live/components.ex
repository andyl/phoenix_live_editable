defmodule PleDemoBase.Components do

  use Phoenix.Component

  @doc """
  Headline Component

  in the LiveView: `import PleDemoBase.Components`

  in the HEEX template: `<.headline text="mytext"/>`
  """
  def headline(assigns) do
    ~H"""
    <span style="border-bottom: 1px dashed blue;">
    <%= @text %>
    </span>
    """
  end

end
