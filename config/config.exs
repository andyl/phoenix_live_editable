use Mix.Config

config :live_editable,
  env: Mix.env()

# ----- PHX_DEMO_BASE

config :phx_demo_base, PhxDemoBaseWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4GI1s5NnxDzI+Le2lVANn7DEDuC0KYYIOrBlbzMdEkuW0GoO92Hs8bUDEcZa20mM",
  render_errors: [view: PhxDemoBaseWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhxDemoBase.PubSub,
  live_view: [signing_salt: "rRioLeCG"]

# ----- PHX_DEMO_MILLIGRAM

config :phx_demo_bootstrap5, PhxDemoBootstrap5Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "oYz2uutPwI7bJV8WYG0w4W+7sOTywaRYlqzs97u7guF503Qx6VgPuaWEDLUJVepv",
  render_errors: [view: PhxDemoBootstrap5Web.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhxDemoBootstrap5.PubSub,
  live_view: [signing_salt: "rbmvdw8n"]

# ----- PHX_DEMO_MILLIGRAM

config :phx_demo_milligram, PhxDemoMilligramWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bzu5s+45Yzl+rl59gfF+ej+vdcHj4pLGfTvdIwW1X06ZR00cIVbo9teXpdIhuhWn",
  render_errors: [view: PhxDemoMilligramWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhxDemoMilligram.PubSub,
  live_view: [signing_salt: "nxJkew8n"]

# ----- PHX_DEMO_TAILWIND

config :phx_demo_tailwind, PhxDemoTailwindWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JEOaYOnSgoTz1+r0yMPV/7VVWqJNe2HECZIKNy0bALwTZvtf/xDJzUWXNgTP2BJR",
  render_errors: [view: PhxDemoTailwindWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhxDemoTailwind.PubSub,
  live_view: [signing_salt: "ZjpUwCFP"]

# ----- MISC

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

config :live_editable, css_framework: Phoenix.LiveEditable.Milligram

import_config "#{Mix.env()}.exs"
