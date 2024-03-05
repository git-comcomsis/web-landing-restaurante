import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :restaurant, RestaurantWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "flgTTjXABvLo1WoSceTS6dixx499RwKqEa/Ru5WQ9Ln8p9wUvM2vWYgafiuVv5dw",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
