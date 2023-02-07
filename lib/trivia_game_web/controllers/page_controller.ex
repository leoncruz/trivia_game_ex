defmodule TriviaGameWeb.PageController do
  use TriviaGameWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
