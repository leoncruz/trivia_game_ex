defmodule TriviaGame.Question do
  defstruct [:question, :type, :difficulty, :incorrect_answers, :correct_answer, :answers]
end
