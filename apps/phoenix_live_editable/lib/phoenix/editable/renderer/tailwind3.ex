defmodule Phoenix.Editable.Renderer.Tailwind3 do

  @moduledoc """
  Render methods for the Tailwind3 CSS framework.
  """

  require Phoenix.LiveEditable.Svg
  alias Phoenix.LiveEditable.Svg

  import Phoenix.HTML

  use Phoenix.Component

  # ----- text -----

  def render(%{ple_type: "text", ple_mode: "anchor", ple_data: nil} = assigns) do
    ~H"""
    <span style="cursor: pointer; border-bottom: 1px dashed blue;" phx-click='ple-focus' phx-target={@myself}>
      <span style="color: red; font-style: italic;">Empty</span>
    </span>
    """
  end

  def render(%{ple_type: "text", ple_mode: "anchor"} = assigns) do
    ~H"""
    <span style="cursor: pointer; border-bottom: 1px dashed blue;" phx-click='ple-focus' phx-target={@myself}>
      <%= @ple_data %>
    </span>
    """
  end

  def render(%{ple_type: "text", ple_mode: "focus"} = assigns) do
    ~H"""
    <div>
      <form style="display: inline;" phx-submit={@ple_action} phx-target={@myself} phx-click-away='ple-blur'>
        <input style="width: 100px;" type="text" name="data" target={@myself} value={@ple_data}/>
        <button class="button" style='margin-left: 5px' type='submit'>
          <%= raw Svg.inline("CircleOk") %>
        </button>
      </form>
      <button class="button" style='margin-left: 5px'>
        <%= raw Svg.inline("CircleCancel") %>
      </button>
    </div>
    """
  end

  # ----- select -----

  def render(%{ple_type: "select", ple_mode: "anchor", ple_data: nil} = assigns) do
    ~H"""
    <span style="cursor: pointer; border-bottom: 1px dashed blue;" phx-click='ple-focus' phx-target={@myself}>
      <span style="color: red; font-style: italic;">Empty</span>
    </span>
    """
  end

  def render(%{ple_type: "select", ple_mode: "anchor"} = assigns) do
    ~H"""
    <span style="cursor: pointer; border-bottom: 1px dashed blue;" phx-click='ple-focus' phx-target={@myself}>
      <%= @ple_data %>
    </span>
    """
  end

  def render(%{ple_type: "select", ple_mode: "focus"} = assigns) do
    ~H"""
    <div>
      <form phx-change="ple-default-save" phx-target={@myself} phx-click-away="ple-blur">
        <select name="data"
          class="form-select appearance-none block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white
                 bg-clip-padding bg-no-repeat border border-solid border-gray-300 rounded transition ease-in-out
                 m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
        >
        <option selected><%= @ple_data %></option>
        <%= for option <- option_map(@ple_options) do %>
          <option value={option.id}><%= option.value %></option>
        <% end %>
        </select>
      </form>
    </div>
    """
  end

  # ----- helpers -----

  # map in the form %{id1: val1, id2: val2, ...} => DATA=id
  defp option_map(options) when is_map(options) do
    options
    |> Enum.map(&(&1))
    |> Enum.map(&(%{id: elem(&1,0), value: elem(&1,1)}))
  end

  # list in the form ~w(word1, word2, word3, word4) => DATA=word
  defp option_map(options) when is_list(options) do
    options
    |> Enum.map(&(%{id: &1, value: &1}))
  end

end
