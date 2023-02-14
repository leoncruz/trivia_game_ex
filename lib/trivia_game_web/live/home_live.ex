defmodule TriviaGameWeb.HomeLive do
  use TriviaGameWeb, :live_view

  def mount(_params, session, socket) do
    current_user =
      if Map.has_key?(session, "user_token") do
        TriviaGame.Accounts.get_user_by_session_token(session["user_token"])
      else
        nil
      end

    {:ok, assign(socket, :current_user, current_user)}
  end

  def render(assigns) do
    ~H"""
      <div class="h-full w-full flex items-center justify-center">  
        <%= if @current_user do %>
          <%= link "New Game", to: Routes.home_path(@socket, :index), class: "py-2 px-4 rounded text-white bg-violet-500" %>
        <% end %>
      </div>
    """
  end
end
