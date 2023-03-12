defmodule TriviaGame.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      TriviaGame.Repo,
      # Start the Telemetry supervisor
      TriviaGameWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: TriviaGame.PubSub},
      # Start the Endpoint (http/https)
      TriviaGameWeb.Endpoint,
      # Start a worker by calling: TriviaGame.Worker.start_link(arg)
      # {TriviaGame.Worker, arg}
      TriviaGame.Game.State
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TriviaGame.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TriviaGameWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
