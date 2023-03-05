defmodule TriviaGame.Game do
  alias TriviaGame.OpenTriviaAPI

  defdelegate get_categories, to: OpenTriviaAPI

  def get_questions(category_id) do
    questions = OpenTriviaAPI.get_questions(category_id)

    Enum.map(questions, fn question ->
      correct_answer = question.correct_answer
      incorrect_answers = question.incorrect_answers

      Map.put(question, :answers, Enum.shuffle([correct_answer] ++ incorrect_answers))
    end)
  end
end
