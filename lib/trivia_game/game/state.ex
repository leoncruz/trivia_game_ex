defmodule TriviaGame.Game.State do
  use Agent

  @module __MODULE__

  def start_link(_opts) do
    Agent.start_link(fn -> %{} end, name: @module)
  end

  def save_answer(user_id, question, user_answer) do
    Agent.update(@module, fn state ->
      user_state = Map.get(state, user_id, %{})

      answers =
        user_state
        |> Map.put_new(:answers, %{})
        |> Map.get(:answers)
        |> Map.put(question.question, %{question: question, answer: user_answer})

      Map.put(state, user_id, %{answers: answers})
    end)
  end

  def get_answers(user_id) do
    Agent.get(@module, fn state ->
      state
      |> Map.get(user_id, %{})
      |> Map.get(:answers)
    end)
  end
end
