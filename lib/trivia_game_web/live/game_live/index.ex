defmodule TriviaGameWeb.GameLive.Index do
  use TriviaGameWeb, :live_view

  alias TriviaGame.Game

  alias Phoenix.LiveView.JS

  def mount(%{"category" => category_id}, _session, socket) do
    case connected?(socket) do
      true ->
        questions = Game.get_questions(category_id)

        {first_question, questions} = Game.next_question(questions)

        socket =
          socket
          |> assign(:questions, questions)
          |> assign(:current_question, first_question)
          |> assign(:loading, false)

        {:ok, socket}

      false ->
        {:ok, assign(socket, :loading, true)}
    end
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, socket}
  end

  def handle_event("respond", params, socket) do
    %{"answer" => answer, "question" => question} = params

    %{current_user: current_user, questions: questions} = socket.assigns

    Game.respond(current_user.id, question, answer)

    case Game.next_question(questions) do
      :finish ->
        {:noreply,
         push_patch(socket,
           to: Routes.game_index_path(socket, :index)
         )}

      {next_question, question_rest} ->
        socket =
          socket
          |> assign(:questions, question_rest)
          |> assign(:current_question, next_question)

        {:noreply, socket}
    end
  end
end
