import Config

# ----- PLE_DEMO_BASE

config :ple_demo_base, PleDemoBaseWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:ple_demo_base, ~w(--sourcemap=inline --watch)]}
  ]

config :ple_demo_base, PleDemoBaseWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/ple_demo_base_web/(live|views)/.*(ex)$",
      ~r"lib/ple_demo_base_web/templates/.*(eex)$"
    ]
  ]

# ----- PLE_DEMO_MILLIGRAM

config :ple_demo_milligram, PleDemoMilligramWeb.Endpoint,
  http: [port: 4001],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:ple_demo_milligram, ~w(--sourcemap=inline --watch)]}
  ]

config :ple_demo_milligram, PleDemoMilligramWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/ple_demo_milligram_web/(live|views)/.*(ex)$",
      ~r"lib/ple_demo_milligram_web/templates/.*(eex)$"
    ]
  ]

# ----- PLE_DEMO_TAILWIND3

config :ple_demo_tailwind3, PleDemoTailwind3Web.Endpoint,
  http: [port: 4002],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:ple_demo_tailwind3, ~w(--sourcemap=inline --watch)]}
  ]

config :ple_demo_tailwind3, PleDemoTailwind3Web.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/ple_demo_tailwind3_web/(live|views)/.*(ex)$",
      ~r"lib/ple_demo_tailwind3_web/templates/.*(eex)$"
    ]
  ]

# ----- ESBUILD

config :esbuild,
  version: "0.14.29",
  ple_demo_base: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/ple_demo_base/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ],
  ple_demo_milligram: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/ple_demo_milligram/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ],
  ple_demo_tailwind3: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../apps/ple_demo_tailwind3/assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# ----- MISC

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :plug_init_mode, :runtime

config :phoenix, :stacktrace_depth, 20
