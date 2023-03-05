defmodule TriviaGameWeb.GameLive.Category do
  use TriviaGameWeb, :live_view

  alias TriviaGame.Game

  def mount(_params, _session, socket) do
    categories = Game.get_categories()

    {:ok, assign(socket, categories: categories)}
  end
end
