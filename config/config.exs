# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :covid_hotspot, CovidHotspotWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kcChMtPAPLVFIdqoCN8ZreU1yLq4/2jIdzaJL1An9AQUw0ldNrKZKfYE8wXnZi0h",
  render_errors: [view: CovidHotspotWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CovidHotspot.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "L8Hi5zM7"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :covid_hotspot, :covid_data_module, CovidHotspot.BingCovidData
config :covid_hotspot, :google_analytics_tag, ""

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
