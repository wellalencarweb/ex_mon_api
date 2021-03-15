# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ex_mon_api,
  ecto_repos: [ExMonApi.Repo]

# Configures the endpoint
config :ex_mon_api, ExMonApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yoO8t6EXOw4Mm+FJZGOmH4+mfzRrwhbHhNyxnbPlIxAoBnQCyjLEhPuGfOj3S/4R",
  render_errors: [view: ExMonApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ExMonApi.PubSub,
  live_view: [signing_salt: "z/VZFrK4"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
