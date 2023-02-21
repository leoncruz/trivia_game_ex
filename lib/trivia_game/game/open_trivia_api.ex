defmodule TriviaGame.OpenTriviaAPI do
  alias TriviaGame.ApiClient

  @base_url "https://opentdb.com"
  @category_url "#{@base_url}/api_category.php"

  def categories(requester \\ ApiClient) do
    result = requester.get(@category_url)

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
end
