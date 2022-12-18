defmodule Phoenix.Editable do

  attr :id, :string, required: true, doc: "Unique ID"
  attr :value, :string, doc: "Text value"

  def text(attributes) do
  end

  attr :id, :string, required: true, doc: "Unique ID"
  attr :value, :string, doc: "Value"
  attr :options, :list, doc: "List of options"

  def select(attributes) do
  end
end
