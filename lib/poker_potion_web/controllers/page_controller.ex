defmodule PokerPotionWeb.PageController do
  use PokerPotionWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
