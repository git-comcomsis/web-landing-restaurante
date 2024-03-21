import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :web_landing_restaurante, WebLandingRestauranteWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "ju8Oi5qv5ABpUtgFO5LKVTc979ZXL2ScMPlNMhTTcCP59THcbTFgllTy7IVM4Dz3",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
