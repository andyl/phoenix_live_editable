import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ple_demo_tailwind3, PleDemoTailwind3Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "CJ+koUc8vFe0DgCnCBH1YaEdsP40eTx+H3dWSmK3WKfVAh4e/H7XqLzLYh3cdup6",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
