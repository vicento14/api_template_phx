import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :api_template_phx, ApiTemplatePhxWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "WRKtU9B8QLVfe5x7IyxqG9X+hB0mkG2SMSfmGOqGbsIujqsySywFjXjB3lz5pAVu",
  server: false

# In test we don't send emails
config :api_template_phx, ApiTemplatePhx.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
