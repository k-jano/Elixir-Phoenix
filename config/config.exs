# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :poker_potion,
  ecto_repos: [PokerPotion.Repo]

# Configures the endpoint
config :poker_potion, PokerPotionWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eMSILYqOXVKjdLJVDkeMu7r6yORu7qnowLN4HsC7bS45SF5i2jaDMnjhSmbJqQgi",
  render_errors: [view: PokerPotionWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PokerPotion.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
