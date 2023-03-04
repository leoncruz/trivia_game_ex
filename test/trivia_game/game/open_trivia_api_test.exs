defmodule TriviaGame.OpenTriviaAPITest do
  use TriviaGame.DataCase

  import Mox

  alias TriviaGame.OpenTriviaAPI

  describe "#get_categories" do
    test "should return a list of categories" do
      expect(TriviaGame.ApiClientMock, :get, fn _url ->
        categories = [
          %{id: 9, name: "General Knowledge"},
          %{id: 10, name: "Entertainment: Books"},
          %{id: 11, name: "Entertainment: Film"},
          %{id: 12, name: "Entertainment: Music"}
        ]

        {:ok,
         %TriviaGame.ApiClientBehavior.Response{
           body: %{"trivia_categories" => categories},
           status: 200
         }}
      end)

      result = OpenTriviaAPI.get_categories()

      Enum.each(result, fn category ->
        assert %TriviaGame.Category{} = category
      end)
    end

    test "should return an :error when not expected response occours" do
      expect(TriviaGame.ApiClientMock, :get, fn _url ->
        {:error, %TriviaGame.ApiClientBehavior.Response{body: %{}, status: 500}}
      end)

      result = OpenTriviaAPI.get_categories()

      assert result == :error
    end
  end

  describe "get_questions" do
    test "should return a list of questions based on informed category" do
      expect(TriviaGame.ApiClientMock, :get, fn _args ->
        questions = [
          %{
            question: "Which Russian author wrote the epic novel War and Peace?",
            type: "multiple",
            difficulty: "medium",
            incorrect_answers: ["Fyodor Dostoyevsky", "Alexander Pushkin", "Vladimir Nabokov"],
            correct_answer: "Leo Tolstoy"
          }
        ]

        {:ok,
         %TriviaGame.ApiClientBehavior.Response{body: %{"results" => questions}, status: 200}}
      end)

      result = OpenTriviaAPI.get_questions(1)

      Enum.each(result, fn question ->
        assert %TriviaGame.Question{} = question
      end)
    end

    test "should return an :error when not expected response occours" do
      expect(TriviaGame.ApiClientMock, :get, fn _url ->
        {:error, %TriviaGame.ApiClientBehavior.Response{body: %{}, status: 500}}
      end)

      result = OpenTriviaAPI.get_questions(1)

      assert result == :error
    end
  end
end
