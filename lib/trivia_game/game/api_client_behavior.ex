defmodule TriviaGame.ApiClientBehavior.Response do
  defstruct [:body, :status]
end

defmodule TriviaGame.ApiClientBehavior do
  @callback get(String.t()) :: {:ok | :error, TriviaGame.ApiClient.Response}
end
