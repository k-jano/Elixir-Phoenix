use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :poker_potion, PokerPotionWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :poker_potion, PokerPotion.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "poker_potion_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
