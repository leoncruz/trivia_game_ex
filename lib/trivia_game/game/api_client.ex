defmodule TriviaGame.ApiClient.Response do
  defstruct [:body, :status]
end

defmodule TriviaGame.ApiClient do
  alias TriviaGame.ApiClient.Response

  @spec get(String.t()) :: {:ok | :error, Response}
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
