defmodule TriviaGameWeb.GameLive.Index do
  use TriviaGameWeb, :live_view

  alias TriviaGame.Game

  def mount(%{"category" => category_id}, _session, socket) do
    questions = Game.get_questions(category_id)

    {first_question, questions} = remove_question(questions)

    socket =
      socket
      |> assign(:questions, questions)
      |> assign(:current_question, first_question)

    {:ok, socket}
  end

  defp remove_question(questions) do
    [first_question | rest] = questions

    {first_question, rest}
  end
end
