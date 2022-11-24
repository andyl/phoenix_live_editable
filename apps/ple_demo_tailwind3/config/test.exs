import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ple_demo_tailwind3, PleDemoTailwind3Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "HQEJ/ywNhc8w5IfJxlgs6sj67QF+HoVlMryp3akoynGaeraW6QYHQJVk+zPYXWs/",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
