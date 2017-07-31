# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :band_manager,
  ecto_repos: [BandManager.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :band_manager, BandManagerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Rq86g4P/jWwdxDiwXyyr7gohHB8ib5tP5lOh6Rsc80Jzfmfe++HDLYHDPxR1ap+L",
  render_errors: [view: BandManagerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BandManager.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
