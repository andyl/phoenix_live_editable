import Config

# For production, don't forget to configure the url host
# to something meaningful, Phoenix uses this information
# when generating URLs.

# ----- PLE_DEMO_BASE

config :ple_demo_base, PleDemoBaseWeb.Endpoint,
  url: [host: "example.com", port: 8080],
  check_origin: false,
  cache_static_manifest: "priv/static/cache_manifest.json"

# ----- PLE_DEMO_MILLIGRAM

config :ple_demo_milligram, PleDemoMilligramWeb.Endpoint,
  url: [host: "example.com", port: 8081],
  check_origin: false,
  cache_static_manifest: "priv/static/cache_manifest.json"

# ----- PLE_DEMO_MILLIGRAM

config :ple_demo_tailwind3, PleDemoTailwind3Web.Endpoint,
  url: [host: "example.com", port: 8082],
  check_origin: false,
  cache_static_manifest: "priv/static/cache_manifest.json"

# ## SSL Support
#
# To get SSL working, you will need to add the `https` key
# to the previous section and set your `:url` port to 443:
#
#     config :live_editable_web, LiveEditableWeb.Endpoint,
#       ...
#       url: [host: "example.com", port: 443],
#       https: [
#         port: 443,
#         cipher_suite: :strong,
#         keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#         certfile: System.get_env("SOME_APP_SSL_CERT_PATH"),
#         transport_options: [socket_opts: [:inet6]]
#       ]
#
# The `cipher_suite` is set to `:strong` to support only the
# latest and more secure SSL ciphers. This means old browsers
# and clients may not be supported. You can set it to
# `:compatible` for wider support.
#
# `:keyfile` and `:certfile` expect an absolute path to the key
# and cert in disk or a relative path inside priv, for example
# "priv/ssl/server.key". For all supported SSL configuration
# options, see https://hexdocs.pm/plug/Plug.SSL.html#configure/1
#
# We also recommend setting `force_ssl` in your endpoint, ensuring
# no data is ever sent via http, always redirecting to https:
#
#     config :live_editable_web, LiveEditableWeb.Endpoint,
#       force_ssl: [hsts: true]
#
# Check `Plug.SSL` for all available options in `force_ssl`.

# Do not print debug messages in production
config :logger, level: :info

