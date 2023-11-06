# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :populator,
  generators: [binary_id: true]

# Configures the endpoint
config :populator, PopulatorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "V+sEzTrY4UtZzVCJdffwca4YQPI1d7tOm/RxSB6p09bs1epIrvuW1zxTXl92dkto",
  render_errors: [view: PopulatorWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Populator.PubSub,
  live_view: [signing_salt: "QEaVgNCy"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# config :influxdb,
#   url: "http://localhost:8086",
#   db: "app_monitoring",
#   username: "b0a04gl",
#   password: "Free23.."


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
