import Config

config :phoenix_live_editable,
  env: Mix.env()

# ----- PLE_DEMO_BASE

config :ple_demo_base, PleDemoBaseWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4GI1s5NnxDzI+Le2lVANn7DEDuC0KYYIOrBlbzMdEkuW0GoO92Hs8bUDEcZa20mM",
  render_errors: [view: PleDemoBaseWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PleDemoBase.PubSub,
  live_view: [signing_salt: "rRioLeCG"]

# ----- PLE_DEMO_MILLIGRAM

config :ple_demo_milligram, PleDemoMilligramWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bzu5s+45Yzl+rl59gfF+ej+vdcHj4pLGfTvdIwW1X06ZR00cIVbo9teXpdIhuhWn",
  render_errors: [view: PleDemoMilligramWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PleDemoMilligram.PubSub,
  live_view: [signing_salt: "nxJkew8n"]

# ----- PLE_DEMO_TAILWIND3

config :ple_demo_tailwind3, PleDemoTailwind3Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JEOaYOnSgoTz1+r0yMPV/7VVWqJNe2HECZIKNy0bALwTZvtf/xDJzUWXNgTP2BJR",
  render_errors: [view: PleDemoTailwind3Web.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PleDemoTailwind3.PubSub,
  live_view: [signing_salt: "ZjpUwCFP"]

# ----- MISC

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

# TODO: make this config app-specific
# config :phoenix_live_editable, css_framework: Phoenix.LiveEditable.Ui.Bootstrap5

import_config "#{Mix.env()}.exs"
