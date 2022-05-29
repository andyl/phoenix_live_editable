use Mix.Config

# Configures the endpoint
config :phx_demo_base, PhxDemoBaseWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4GI1s5NnxDzI+Le2lVANn7DEDuC0KYYIOrBlbzMdEkuW0GoO92Hs8bUDEcZa20mM",
  render_errors: [view: PhxDemoBaseWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhxDemoBase.PubSub,
  live_view: [signing_salt: "rRioLeCG"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
