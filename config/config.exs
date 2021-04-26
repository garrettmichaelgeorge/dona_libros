# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dona_libros,
  ecto_repos: [DonaLibros.Repo]

# Configures the endpoint
config :dona_libros, DonaLibrosWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "W5gwUHa7D2TFqlTYInZQ1MMFt3envNbEEKCxZ4Ii0u8pboQlKirDOXR/8OLNz4iw",
  render_errors: [view: DonaLibrosWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DonaLibros.PubSub,
  live_view: [signing_salt: "guIFwXtf"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
