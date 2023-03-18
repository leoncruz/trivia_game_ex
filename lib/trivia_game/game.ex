defmodule TriviaGame.Game do
  alias TriviaGame.OpenTriviaAPI
  alias TriviaGame.Game.State
  alias TriviaGame.Question

  defdelegate get_categories, to: OpenTriviaAPI

  def get_questions(category_id) do
    questions = OpenTriviaAPI.get_questions(category_id)

    Enum.map(questions, fn question ->
      correct_answer = question.correct_answer
      incorrect_answers = question.incorrect_answers

      Map.put(question, :answers, Enum.shuffle([correct_answer] ++ incorrect_answers))
    end)
  end

  def respond(user_id, question, user_answer) do
    question = %Question{
      question: question["question"],
      answers: question["answers"],
      correct_answer: question["correct_answer"],
      difficulty: question["difficulty"],
      incorrect_answers: question["incorrect_answers"],
      type: question["type"]
    }

    State.save_answer(user_id, question, user_answer)
  end

  def next_question(questions) when length(questions) == 0, do: :finish

  def next_question(questions) do
    [first_question | rest] = questions

    {first_question, rest}
  end
end
