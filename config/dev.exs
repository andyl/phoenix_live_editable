import Config

# ----- PLE_DEMO_BASE

config :ple_demo_base, PleDemoBaseWeb.Endpoint,
  http: [port: 4040],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:ple_demo_base, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:ple_demo_base, ~w(--watch)]}
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
  http: [port: 4041],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:ple_demo_milligram, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:ple_demo_milligram, ~w(--watch)]}
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
  http: [port: 4042],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:ple_demo_tailwind3, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:ple_demo_tailwind3, ~w(--watch)]}
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

# ----- MISC

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :plug_init_mode, :runtime

config :phoenix, :stacktrace_depth, 20
