defmodule TriviaGame.ApiClientMockSuccess do
  alias TriviaGame.ApiClient.Response

  def get(_url) do
    {:ok,
     %Response{
       body: %{
         "trivia_categories" => [
           %{"id" => 9, "name" => "General Knowledge"},
           %{"id" => 10, "name" => "Entertainment: Books"},
           %{"id" => 11, "name" => "Entertainment: Film"}
         ]
       },
       status: 200
     }}
  end
end

defmodule TriviaGame.ApiClientMockError do
  alias TriviaGame.ApiClient.Response

  def get(_url), do: {:error, %Response{body: %{}, status: 500}}
end

defmodule TriviaGame.OpenTriviaAPITest do
  use TriviaGame.DataCase

  alias TriviaGame.OpenTriviaAPI
  alias TriviaGame.ApiClientMockSuccess
  alias TriviaGame.ApiClientMockError

  describe "#categories" do
    test "should return a list of categories" do
      result = OpenTriviaAPI.categories(ApiClientMockSuccess)

      Enum.each(result, fn category ->
        assert %TriviaGame.Category{} = category
      end)
    end

    test "should return an :error when not expected response occours" do
      result = OpenTriviaAPI.categories(ApiClientMockError)

      assert result == :error
    end
  end
end
