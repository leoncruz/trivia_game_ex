defmodule TriviaGameWeb.PageControllerTest do
  use TriviaGameWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Trivia Game"
  end
end
