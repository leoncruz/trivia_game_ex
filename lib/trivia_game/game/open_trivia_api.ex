defmodule TriviaGame.OpenTriviaAPI do
  @base_url "https://opentdb.com"
  @category_url "#{@base_url}/api_category.php"

  def get_categories do
    result = api_client().get(@category_url)

    case result do
      {:ok, response} ->
        %{body: %{"trivia_categories" => trivia_categories}} = response

        Enum.map(trivia_categories, fn category ->
          %TriviaGame.Category{id: category["id"], name: category["name"]}
        end)

      {:error, _} ->
        :error
    end
  end

  def get_questions(category_id) do
    result = api_client().get("#{@base_url}/api.php?amount=10&category=#{category_id}")

    case result do
      {:ok, response} ->
        %{body: %{"results" => questions}} = response

        Enum.map(questions, fn question ->
          %TriviaGame.Question{
            question: question["question"],
            type: question["type"],
            difficulty: question["difficulty"],
            incorrect_answers: question["incorrect_answers"],
            correct_answer: question["correct_answer"]
          }
        end)

      {:error, _} ->
        :error
    end
  end

  defp api_client do
    Application.get_env(:api_client, :trivia, TriviaGame.ApiClient)
  end
end
