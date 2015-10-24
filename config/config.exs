# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :myapp, Myapp.Endpoint,
  url: [host: "daycayr.dev"],
  root: Path.dirname(__DIR__),
  secret_key_base: "ZPA3Z20cc/Rcr/X1RV//TMagRAr7nHeV/TyRH0ZGmehL/uoC1spXOe5H3j9kaY16",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Myapp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# config :phoenix, :template_engines,
#  haml: PhoenixHaml.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
