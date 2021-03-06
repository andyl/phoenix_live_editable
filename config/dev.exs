use Mix.Config

# ----- PHX_DEMO_BASE

config :phx_demo_base, PhxDemoBaseWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../apps/phx_demo_base/assets", __DIR__)
    ]
  ]

config :phx_demo_base, PhxDemoBaseWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/phx_demo_base_web/(live|views)/.*(ex)$",
      ~r"lib/phx_demo_base_web/templates/.*(eex)$"
    ]
  ]

# ----- PHX_DEMO_BOOTSTRAP5

config :phx_demo_bootstrap5, PhxDemoBootstrap5Web.Endpoint,
  http: [port: 4001],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../apps/phx_demo_bootstrap5/assets", __DIR__)
    ]
  ]

config :phx_demo_bootstrap5, PhxDemoBootstrap5Web.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/phx_demo_bootstrap5_web/(live|views)/.*(ex)$",
      ~r"lib/phx_demo_bootstrap5_web/templates/.*(eex)$"
    ]
  ]

# ----- PHX_DEMO_MILLIGRAM

config :phx_demo_milligram, PhxDemoMilligramWeb.Endpoint,
  http: [port: 4002],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../apps/phx_demo_milligram/assets", __DIR__)
    ]
  ]

config :phx_demo_milligram, PhxDemoMilligramWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/phx_demo_milligram_web/(live|views)/.*(ex)$",
      ~r"lib/phx_demo_milligram_web/templates/.*(eex)$"
    ]
  ]

# ----- PHX_DEMO_TAILWIND

config :phx_demo_tailwind, PhxDemoTailwindWeb.Endpoint,
  http: [port: 4003],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../apps/phx_demo_tailwind/assets", __DIR__)
    ]
  ]

config :phx_demo_tailwind, PhxDemoTailwindWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/phx_demo_tailwind_web/(live|views)/.*(ex)$",
      ~r"lib/phx_demo_tailwind_web/templates/.*(eex)$"
    ]
  ]

# ----- MISC

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :plug_init_mode, :runtime

config :phoenix, :stacktrace_depth, 20
