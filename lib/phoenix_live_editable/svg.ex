defmodule Phoenix.LiveEditable.Svg do
  defmacro inline(file) do
    path = static_path(file)
    case File.read(path) do
      {:ok, text} -> quote do: {:safe, unquote(text)}
      {:error, _} -> raise "No SVG for #{path}"
    end
  end

  defp static_path(file_name) do
    path = "#{__DIR__}/../../assets/static/svg"
    [path, "#{file_name}.svg"] |> Path.join() |> Path.expand 
  end
end
