defmodule Phoenix.LiveEditable.RenderUtil do

  @moduledoc """
  Helpers for render modules.
  """

  @doc """
  Generates tag for phx-target binding.

  Example use:

      <.live_component id="asdf" phx-target={target(@ple_event_target, @myself)}, ... />

  For background information, study `form bindings`, `@myself` and `phx-target`.
  """
  def target(ple_event_target, myself) do
    case ple_event_target do
      nil -> nil
      "view" -> nil
      "component" -> myself
      "myself" -> myself
      catchall -> catchall
    end
  end

end
