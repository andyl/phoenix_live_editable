import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ple_demo_milligram, PleDemoMilligramWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "R/rC2QeDETAh0VsX1UST1ZXVjTFrSqtl8pwZCzdxl4j7xMAYy8VG87y7bhRskaZ2",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
