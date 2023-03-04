defmodule TriviaGame.ApiClient do
  alias TriviaGame.ApiClientBehavior.Response

  @behaviour TriviaGame.ApiClientBehavior

  @impl true
  def get(url) do
    result = HTTPoison.get(url)

    case result do
      {:ok, %HTTPoison.Response{body: body, status_code: status}} ->
        parsed_body = Jason.decode!(body)

        {:ok, %Response{body: parsed_body, status: status}}

      {:error, %HTTPoison.Error{}} ->
        {:error, %Response{body: %{}, status: 500}}
    end
  end
end
