Mox.defmock(TriviaGame.ApiClientMock, for: TriviaGame.ApiClientBehavior)

Application.put_env(:api_client, :trivia, TriviaGame.ApiClientMock)

ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(TriviaGame.Repo, :manual)
