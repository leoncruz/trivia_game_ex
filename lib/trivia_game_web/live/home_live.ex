defmodule TriviaGameWeb.HomeLive do
  use TriviaGameWeb, :live_view

  def render(assigns) do
    ~H"""
      <div class="h-full w-full flex items-center justify-center">  
        <%= link "New Game", to: Routes.home_path(@socket, :index), class: "py-2 px-4 rounded text-white bg-violet-500" %>
      </div>
    """
  end
end
