defmodule Phoenix.LiveEditable.Svg do

  @moduledoc """
  Inline SVG utilities.

  FontAwesome-style SVG vector icons, embedded in your code.

  The workflow is: 
  - download the SVG to `assets/static/svg`
  - customize the SVG with default size, color, etc.
  - use the inline SVG macros in your views and string functions

  This approach compiles the SVG into your binary.  Fast, efficient and safe.
  Simpler to use than CDN or NPM approaches.

  To learn more, read the [Elixir Forum Thread][1] on embedded SVGs.

  [1]: https://elixirforum.com/t/svgs-eex-tags-inlining-from-external-file/25942
  """

  @doc """
  Inline SVG for EEX tags.

  Usage Example:

  The file `MyIcon` must be located in `assets/static/svg/MyIcon.svg`.

  You'll have to `require` the SVG module in your view:
  
      defmodule MyappWeb.PageView do
        use MyappWeb, :view
        require Phoenix.LiveEditable.Svg
      end

  Then you can use the function in an EEX tag:

      <%= Phoenix.LiveEditable.Svg.inline_tag("MyIcon") %>
      
  """
  defmacro inline_tag(file) do
    path = static_path(file)
    case File.read(path) do
      {:ok, text} -> quote do: {:safe, unquote(text)}
      {:error, _} -> raise "No SVG for #{path}"
    end
  end

  @doc """
  Inline SVG for elixir functions.

  Returns the SVG text.

  Usage Example:

  The file `MyIcon` must be located in `assets/static/svg/MyIcon.svg`.

  You'll have to `require` the SVG module in your target code:
  
      defmodule MyappWeb.Mycode do
        require Phoenix.LiveEditable.Svg

        def my_svg(file) do
          Phoenix.LiveEditable.Svg.inline(file)
        end
      end

  Then you can use the function in your Elixir code:

      Myapp.Mycode.my_svg("MyIcon")
      
  """
  defmacro inline(file) do
    path = static_path(file)
    case File.read(path) do
      {:ok, text} -> quote do: unquote(text)
      {:error, _} -> raise "No SVG for #{path}"
    end
  end

  defp static_path(file_name) do
    path = "#{__DIR__}/../../../assets/static/svg"
    [path, "#{file_name}.svg"] |> Path.join() |> Path.expand 
  end
end

