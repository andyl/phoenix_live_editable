import Config

# config/runtime.exs is executed for all environments, including
# during releases. It is executed after compilation and before the
# system starts, so it is typically used to load production configuration
# and secrets from environment variables or elsewhere. Do not define
# any compile-time configuration in here, as it won't be applied.
# The block below contains prod specific runtime configuration.
if config_env() == :prod do
  # The secret key base is used to sign/encrypt cookies and other secrets.
  # A default value is used in config/dev.exs and config/test.exs but you
  # want to use a different value for prod and you most likely don't want
  # to check this value into version control, so we use an environment
  # variable instead.
  secret_key_base = "LongSecretKeyLongSecretKeyLongSecretKeyLongSecretKeyLongSecretKey"

  # Set IP to  {0, 0, 0, 0, 0, 0, 0, 1} for local network only access.

  # ----- PLE_DEMO_BASE

  config :ple_demo_base, PleDemoBaseWeb.Endpoint,
    http: [
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: "8080"
    ],
    secret_key_base: secret_key_base

  # ----- PLE_DEMO_MILLIGRAM

  config :ple_demo_milligram, PleDemoMilligramWeb.Endpoint,
    http: [
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: "8081"
    ],
    secret_key_base: secret_key_base

  # ----- PLE_DEMO_TAILWIND3

  config :ple_demo_tailwind3, PleDemoTailwind3Web.Endpoint,
    http: [
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: "8082"
    ],
    secret_key_base: secret_key_base

  # ----- RELEASE CONFIG
  config :ple_demo_base, PleDemoBaseWeb.Endpoint, server: true
  config :ple_demo_milligram, PleDemoMilligramWeb.Endpoint, server: true
  config :ple_demo_tailwind3, PleDemoTailwind3Web.Endpoint, server: true

  # ## Using releases
  #
  # If you are doing OTP releases, you need to instruct Phoenix
  # to start each relevant endpoint:
  #
  #     config :ding_web, DingWeb.Endpoint, server: true
  #
  # Then you can assemble a release by calling `mix release`.
  # See `mix help release` for more information.

end
