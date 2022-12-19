defmodule Phoenix.Editable do
  use Phoenix.LiveView
  import Phoenix.LiveEditable.Util

  attr :id, :string, default: nil, doc: "Unique ID"
  attr :value, :string, default: nil, doc: "Text value"

  def text(assigns) do
    ~H"""
    <.live_component module={Phoenix.Editable.Base} id={@id || random_id()} type="text" ple-data={@value}/>
    """
  end

  attr :id, :string, default: random_id(), doc: "Unique ID"
  attr :value, :string, doc: "Value"
  attr :options, :list, doc: "List of options"

  def select(assigns) do
  end

  # use Phoenix.Component
  #
  # # alias Phoenix.LiveView.JS
  #
  # alias Phoenix.LiveEditable.Util
  #
  # @doc """
  # Editable Text
  #
  # Examples
  #
  # <.editable_text
  # id="my-id"
  # data="asdf"
  # phx_save="save"
  # phx_change="validate" />
  #
  # """
  #
  # attr :id, "string", default: Util.random_id(), doc: "Component ID"
  # attr :data, "string", required: true, doc: "Initial data value"
  # attr :phx_save, "string", required: true, doc: "Save handler"
  # attr :phx_change, "string", default: nil, doc: "Validation handler"
  #
  # def editable_text(assigns) do
  #   ~H"""
  #   <div>HELLO</div>
  #   """
  # end

end
