# Phoenix.LiveEditable 

In-place editing for Phoenix Live View. LiveEditable provides in-line helpers
that you can drop into your LiveView (HEEX) templates.

Example HEEX tag:

    <%= live_editable(assigns, "MyText", id: "textfield", type: "text", on_submit: "save" %>

You'll need to add a handler to your LiveView:

    def handle_event("save", value, socket) end
       ... do something ...
    end

LiveEditable is for admin interfaces and applications where basic inline
editing is desirable.  It supports multiple CSS Frameworks (Tailwind,
Milligram, etc.) and field types (Text, Select, etc.).  LiveEditable is
inspired by [X-Editable][xe]. Try the [online examples][ld]!

LiveEditable is pre-alpha - not ready for production use.

[xe]: http://vitalets.github.io/x-editable
[ld]: http://173.255.255.44:8080

## Demonstration 

IN YOUR BROWSER: 

Try the [online examples][ld]. 

USING DOCKER ON YOUR DESKTOP: 

    $ docker run -p 8080-8082:8080-8082 andyldk/phoenix_live_editable

Now open a browser and visit `http://localhost:8080`

CLONING THE SOURCE TO YOUR DESKTOP: 

    $ git clone https://github.com/andyl/phoenix_live_editable 
    $ cd phoenix_live_editable 
    $ mix deps.get
    $ mix phx.server 

Now open a browser and visit `http://localhost:4040`

## Code Organization 

The [LiveEditable Repo][gh] is an umbrella project.  Subapps include:

| phoenix_live_editable | the LiveView components                           |
| ple_demo_base         | phoenix app with a landing page                   |
| ple_demo_milligram    | phoenix app with LiveEditable using Milligram CSS |
| ple_demo_tailwind3    | phoenix app with LiveEditable using Tailwind3 CSS |
| ple_util              | utility modules to support the demo apps          |

The LiveEditable package on hex.pm contains only the phoenix_live_editable subapp.

[gh]: https://github.com/andyl/phoenix_live_editable

## Installation

PhoenixLiveEditable can be installed in your own LV application by adding
`phoenix_live_editable` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:phoenix_live_editable, github: 'andyl/phoenix_live_editable/apps/phoenix_live_editable'}
  ]
end
```

After that:

    $ mix deps.get && mix deps.compile

Next add LiveEditable configuartion to your `config/config.exs`:

    config :phoenix_live_editable, css_framework: <YOUR_CSS_FRAMEWORK_MODULE>

Valid Framework Modules include:

    - Phoenix.LiveEditable.Milligram
    - Phoenix.LiveEditable.Tailwind3 

Now you can use LiveEditable in your LiveViews and LiveComponents:

    defmodule MyApp.Live.Asdf do
    end

## Customizing LiveEditable

Instructions on how to tweak LiveEditable CSS TBD.

## Extending LiveEditable

Instruction on how to create new LiveEditable modules TBD.

