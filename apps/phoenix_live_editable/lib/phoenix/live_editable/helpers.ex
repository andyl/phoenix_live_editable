defmodule Phoenix.LiveEditable.Helpers do

  def ple(assigns) when is_map(assigns) do
    id = assigns[:id]
    module = assigns[:ple_handler] || Phoenix.LiveEditable.Handler.Default
    assigns = assigns |> Map.delete(:__changed__)

    if module == nil or not is_atom(module) do
      raise ArgumentError,
            ".ple expects module={...} to be given and to be an atom, " <>
              "got: #{inspect(module)}"
    end

    if id == nil do
      raise ArgumentError, ".ple expects id={...} to be given, got: nil"
    end

    case module.__live__() do
      %{kind: :component} ->
        %Phoenix.LiveView.Component{id: id, assigns: assigns, component: module}

      %{kind: kind} ->
        raise ArgumentError, "expected #{inspect(module)} to be a component, but it is a #{kind}"
    end

  end

  def live_editable(assigns) do
    ple(assigns)
  end

end
