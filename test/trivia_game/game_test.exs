defmodule TriviaGame.GameTest do
  use TriviaGame.DataCase, async: true

  alias TriviaGame.Game

  describe "#respond/3" do
    test "should save on state the user answer for informed question" do
      question = %{
        question: "Question #1",
        correct_answer: "false",
        incorrect_answers: ["true"]
      }

      answer = "true"
      user_id = 10

      assert :ok = Game.respond(user_id, question, answer)
    end
  end

  describe "#next_question/1" do
    test "should return :finish when questions is empty" do
      assert :finish = Game.next_question([])
    end

    test "should get first question of list and return tuple with first question and rest" do
      questions = [
        %TriviaGame.Question{question: "Question #1"},
        %TriviaGame.Question{question: "Question #2"},
        %TriviaGame.Question{question: "Question #3"}
      ]

      assert {
               %TriviaGame.Question{question: "Question #1"},
               [
                 %TriviaGame.Question{question: "Question #2"},
                 %TriviaGame.Question{question: "Question #3"}
               ]
             } = Game.next_question(questions)
    end
  end
end
