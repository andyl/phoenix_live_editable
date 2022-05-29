import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ple_demo_base, PleDemoBaseWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "dE/D8u0P0CmD08MkbaDMr/j+o3bnnlrYglvolY/zB2Kd1VD/4CS9d1dEcza997u/",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
