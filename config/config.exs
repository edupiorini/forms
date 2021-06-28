# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :forms,
  ecto_repos: [Forms.Repo]

config :forms, Forms.Repo,
  # configuração para gerar uuid nessas chaves
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

# Configures the endpoint
config :forms, FormsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Bov3GDb1MY7bzR6nXDVNOqpSjpO/JjtX5pP9J0mbhXaSIJyt+DQPtfuYrwxDU8fX",
  render_errors: [view: FormsWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Forms.PubSub,
  live_view: [signing_salt: "kC9hjJI2"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
