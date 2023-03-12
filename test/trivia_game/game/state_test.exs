defmodule TriviaGame.Game.StateTest do
  use TriviaGame.DataCase, async: true

  alias TriviaGame.Game.State

  describe "#save_answer" do
    test "should save a user answer's to a question" do
      question = %TriviaGame.Question{
        question: "Question #1",
        correct_answer: "10",
        incorrect_answers: ["9", "8", "7"]
      }

      answer = "10"
      user_id = 1

      result = State.save_answer(user_id, question, answer)

      assert result == :ok
    end
  end

  describe "#get_answers" do
    test "should return map with answers of informed user id" do
      question1 = %TriviaGame.Question{
        question: "Question #1",
        correct_answer: "10",
        incorrect_answers: ["9", "8", "7"]
      }

      question2 = %TriviaGame.Question{
        question: "Question #2",
        correct_answer: "5",
        incorrect_answers: ["4", "5", "6"]
      }

      State.save_answer(1, question1, "10")
      State.save_answer(2, question2, "5")

      result = State.get_answers(1)

      assert %{"Question #1" => %{answer: "10", question: ^question1}} = result
    end
  end
end
