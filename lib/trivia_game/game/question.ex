defmodule TriviaGame.Question do
  defstruct [:question, :type, :difficulty, :incorrect_answers, :correct_answer, :answers]
end

defimpl Jason.Encoder, for: TriviaGame.Question do
  def encode(value, opts) do
    Jason.Encode.map(
      Map.take(value, [
        :question,
        :type,
        :difficulty,
        :incorrect_answers,
        :correct_answer,
        :answers
      ]),
      opts
    )
  end
end
