use Mix.Config

config :edge_builder, EdgeBuilder.Endpoint,
  http: [port: System.get_env("PORT") || 4000],
  debug_errors: true

# Enables code reloading for development
config :phoenix, :code_reloader, true

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"
