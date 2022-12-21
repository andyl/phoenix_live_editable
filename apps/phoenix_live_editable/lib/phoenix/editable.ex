defmodule Phoenix.Editable do

  @moduledoc """
  Function Components for live-editable data.

  Each of these function components wrapper the core LiveComponent - `Phoenix.Editable.Base`.

  Example usages:

      alias Phoenix.Editable
      <Editable.text value="Hello World"/>
      <Editable.select value="Default" options={~w(Opt1 Opt2 Opt3)}/>

  """
  use Phoenix.Component
  import Phoenix.LiveEditable.Util

  @doc """
  Editable text component.

  Example usages:

      alias Phoenix.Editable
      <Editable.text value="Hello World"/>
      <Editable.text
        id="my-id"
        value="asdf"
        ple_save="save"
        ple_change="validate" />

  """
  attr :id, :string, default: nil, doc: "Unique ID"
  attr :value, :string, default: nil, doc: "Text value"
  attr :ple_event_focus, :string, doc: "Target for focus handler"
  attr :ple_event_save, :string, doc: "Target for save handler"
  attr :ple_event_change, :string, doc: "Target for validation handler"

  def text(assigns) do
    ~H"""
    <.live_component
      module={Phoenix.Editable.Base}
      id={@id || random_id()}
      ple-event-focus={@ple_event_focus}
      ple-render-type="text"
      ple-render-data={@value}
    />
    """
  end

  @doc """
  Editable select component.

  Example usages:

      alias Phoenix.Editable
      <Editable.select value="A" options={~w(x y z)}/>

  """
  attr :id, :string, default: nil, doc: "Unique ID"
  attr :value, :string, doc: "Value"
  attr :options, :list, doc: "List of options"

  def select(assigns) do
    ~H"""
    <.live_component
      module={Phoenix.Editable.Base}
      id={@id || random_id()}
      ple-render-type="select"
      ple-render-data={@value}
      ple-render-options={@options}
    />
    """
  end

end
