# Phoenix.LiveEditable 

LiveView Components for in-place editing. 

LiveEditable provides helpers for your LiveView/HEEX templates.

Example HEEX tag:

    <%= live_editable(assigns, "MyText", id: "textfield", type: "text", on_submit: "save" %>

Add a handler to your LiveView:

    def handle_event("save", value, socket) end
       ... do something ...
    end

See the [online demo][ld] for running examples.

LiveEditable is for admin interfaces and apps that want basic inline editing.
It supports many CSS frameworks (Tailwind, Milligram, etc.) and field types
(Text, Select, etc.).  LiveEditable is inspired by [Vitaliy Potapov's][vp]
[X-Editable][xe]. 

LiveEditable is pre-alpha - not ready for production use.

[xe]: http://vitalets.github.io/x-editable
[ld]: http://phoenix-live-editable.fly.dev
[vp]: https://github.com/vitalets

## Demonstration 

IN YOUR BROWSER: 

Try the [online demo][ld]. 

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

The [LiveEditable Repo][gh] is an umbrella project.  

| Subapp                | Description                                   |
|-----------------------|-----------------------------------------------|
| phoenix_live_editable | LiveView components                           |
| ple_demo_base         | phoenix app with a landing page               |
| ple_demo_milligram    | phoenix app with LiveEditable using Milligram |
| ple_demo_tailwind3    | phoenix app with LiveEditable using Tailwind3 |
| ple_util              | utility modules to support the demo apps      |

The LiveEditable package on hex.pm contains only the phoenix_live_editable
subapp.

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

