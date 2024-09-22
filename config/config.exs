# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :api_template_phx,
  ecto_repos: [ApiTemplatePhx.Repo],
  generators: [timestamp_type: :utc_datetime]

# Skip Migration (Temporary)
config :api_template_phx, ApiTemplatePhx.Repo,
  migration: :skip

# Configures the endpoint
config :api_template_phx, ApiTemplatePhxWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: ApiTemplatePhxWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: ApiTemplatePhx.PubSub,
  live_view: [signing_salt: "mvvGQZ+A"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :api_template_phx, ApiTemplatePhx.Mailer, adapter: Swoosh.Adapters.Local

# Configures Elixir's Logger
config :logger, :console, level: :debug,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ecto, :loggers, [Ecto.LogEntry, &Logger.debug/1]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
