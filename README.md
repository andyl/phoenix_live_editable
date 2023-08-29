# Phoenix.LiveEditable 

LiveView components for in-place editing. 

Example HEEX tag:

    <Editable.text value="Click me to Edit" ple_action="save"/>

Add a handler to your LiveView:

    def handle_event("save", value, socket) end
       ... do something ...
    end

See the [online demo][ld] for running examples.

LiveEditable is for admin interfaces to provide basic inline editing. It
supports many CSS frameworks (Tailwind3, Milligram, Bootstrap5, Bulma) and
field types (Text, Select, etc.).  LiveEditable is inspired by [Vitaliy
Potapov's][vp] [X-Editable][xe], and is designed to be extensible.

LiveEditable is pre-alpha - not ready for demo or production use.

[ld]: http://phoenix-live-editable.fly.dev
[xe]: http://vitalets.github.io/x-editable
[vp]: https://github.com/vitalets

## Demonstration 

DEMO IN YOUR BROWSER: 

Try the [online demo][ld]. 

DEMO USING DOCKER ON YOUR DESKTOP: 

    $ docker run -p 8080-8082:8080-8082 andyldk/phoenix_live_editable

Now open a browser and visit `http://localhost:8080`

DEMO BY CLONING THE SOURCE TO YOUR DESKTOP: 

    $ git clone https://github.com/andyl/phoenix_live_editable 
    $ cd phoenix_live_editable 
    $ mix deps.get
    $ mix phx.server 

Now open a browser and visit `http://localhost:4040`

## Installation

PhoenixLiveEditable can be installed in your own LV application by adding
`phoenix_live_editable` to your list of dependencies in `mix.exs`:

Using the path option: 
```elixir
def deps do
  [
    {:phoenix_live_editable, 
      path: "~/src_root/phoenix_live_editable/apps/phoenix_live_editable"}
  ]
end
```

Using the github option: 
```elixir
def deps do
  [
    {:phoenix_live_editable, 
      github: "andyl/phoenix_live_editable",
      subdir: "apps/phoenix_live_editable"}
  ]
end
```

Using the hex option: 
```elixir
def deps do
  [
    {:phoenix_live_editable, "~> 0.0.1"}
  ]
end
```

After that:

    $ mix deps.get && mix deps.compile

Next add LiveEditable configuartion to your `config/config.exs`:

    config :<your_phoenix_app>, <your endpoint>, [
      live_editable: [ple_renderer: <YOUR_CSS_FRAMEWORK_MODULE>]
    ]

Valid Framework Modules include:

    - Phoenix.Editable.Renderer.Milligram
    - Phoenix.Editable.Renderer.Tailwind3 

Now you can use LiveEditable in your LiveViews and LiveComponents:

    defmodule MyApp.Live.Asdf do
    end

## Code Organization 

The [LiveEditable Repo][gh] is an umbrella project.  This was done to make it
easier to demo and test the LiveEditable components against a variety of CSS
frameworks.  

| Umbrella Subapp         | Description                                   |
|-------------------------|-----------------------------------------------|
| `phoenix_live_editable` | LiveEditable components                       |
| `ple_demo_base`         | phoenix app with a landing page               |
| `ple_demo_milligram`    | phoenix app with LiveEditable using Milligram |
| `ple_demo_tailwind3`    | phoenix app with LiveEditable using Tailwind3 |
| `ple_util`              | utility modules to support the demo apps      |

Note that the LiveEditable package on hex.pm contains only the
`phoenix_live_editable` subapp, not the demo apps.

[gh]: https://github.com/andyl/phoenix_live_editable

## Customizing and Extending LiveEditable

** Renderer Modules **

Renderer modules generate HTML for a specific CSS framework.

Built-in renderer modules include: 

    Phoenix.Editable.Renderer.Bootstrap5
    Phoenix.Editable.Renderer.Milligram
    Phoenix.Editable.Renderer.Tailwind3

A renderer module is selected in application configuration.

    in config/config.exs... 
      
    config :ple_demo_base, PleDemoBaseWeb.Endpoint,
      url: [host: "localhost"],
      secret_key_base: "4GI1s5NnxDzI+Le2lVANn7DEDuC0KYYIOrBlbzMdEkuW0GoO92Hs8bUDEcZa20mM",
      render_errors: [view: PleDemoBaseWeb.ErrorView, accepts: ~w(html json), layout: false],
      pubsub_server: PleDemoBase.PubSub,
      live_view: [signing_salt: "rRioLeCG"],
      live_editable: [ple_renderer: Phoenix.Editable.Renderer.Tailwind3]

You can fork a built-in renderer, or write a renderer from scratch for a new
CSS framework. 

For more information, see the **Renderer Guide**.

** Handler Modules **

Handler modules provide `event_handler` functions that can be used in multiple LiveViews.

Built-in handler modules include: 

    Phoenix.Editable.Handler.Default
    Phoenix.Editable.Handler.Test 

A handler module is selected in a LiveView:

    def MyLiveView do 

        use Phoenix.LiveView
        use Phoenix.Editable.Handler.Default 

        ...

    end

You can fork a built-in handler, or write a handler from scratch, or not use
handlers, or use a combination of handler functions and custom functions.

For more information, see the **Handler Guide**.

## Contributing

The scope of Phoenix.LiveEditable is to cover common [HTML5 input types][1],
[common form controls][2] and basic features (inline/modals, tooltips, validation,
autocompletion, etc.).

[1]: https://developer.mozilla.org/en-US/docs/Learn/Forms/HTML5_input_types
[2]: https://developer.mozilla.org/en-US/docs/Learn/Forms/Other_form_controls

Pull requests welcome!
