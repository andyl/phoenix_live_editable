# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config



config :live_editable_web,
  generators: [context_app: :live_editable]

# Configures the endpoint
config :live_editable_web, LiveEditableWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SP0isPfuXxBGmXklQ0CZi5x98/rAUWTNjhc4OgV3O5QBtJpu61dQu6Vmffh1YZDP",
  render_errors: [view: LiveEditableWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LiveEditable.PubSub,
  live_view: [signing_salt: "QsC1kc3Y"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
