# Phoenix Live Editable (PLE)

In-place editing for Phoenix Live View.

PLE provides in-line helpers that you can drop into your LiveView (LEEX) templates.

Example LEEX tag:

    <%= live_editable(assigns, "MyText", id: "textfield", type: "text", on_submit: "save" %>

You'll need to add a handler to your LiveView:

    def handle_event("save", value, socket) end
       ... do something ...
    end

PLE is good for admin interfaces and applications where off-the-shelf inline
editing is desirable.  It supports multiple CSS Frameworks (Bootstrap,
Milligram, etc.) and field types (Text, Select, etc.) and is designed to be
customized and extended.  PLE is inspired by [X-Editable][xe].

There is a [ple_demo][pd] repo on GitHub, which has links to a live example.

PLE is pre-alpha - not yet ready for production use.

[xe]: http://vitalets.github.io/x-editable/
[pd]: http://github.com/andyl/ple_demo

## Installation

PLE can be installed by adding `live_editable` to your list of dependencies in
`mix.exs`:

```elixir
def deps do
  [
    {:live_editable, github: 'andyl/phoenix_live_editable'}
  ]
end
```

After that:

    $ mix deps.get && mix deps.compile

Next add PLE configuartion to your `config/config.exs`:
    
    config :phoenix_live_editable, css_framework: <YOUR_CSS_FRAMEWORK_MODULE>

Valid Framework Modules include:

    - Phoenix.LiveEditable.Bootstrap4
    - Phoenix.LiveEditable.Milligram

Incorporate PLE javascript into your app:

    INSTRUCTIONS TBD

Incorporate PLE CSS into your app:

    INSTRUCTIONS TBD

Now you can use PLE in your LiveViews and LiveComponents:

    defmodule MyApp.Live.Asdf do
    end

## Customizing PLE

Instructions on how to tweak PLE CSS TBD.

## Extending PLE

Instruction on how to create new PLE modules TBD.

