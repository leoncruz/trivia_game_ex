defmodule TriviaGameWeb.Components.NavBarComponent do
  use Phoenix.Component
  use Phoenix.HTML

  def nav(assigns) do
    ~H"""
    <nav class="h-2 w-screen md:h-16 shadow-lg">
      <div class="h-full invisible md:visible flex items-center justify-between mx-16">
        <%= Phoenix.HTML.Link.link "Home", to: "#" %>

        <h1 class="text-4xl">Trivia Game</h1>

        <div class="flex flex-row space-x-8 items-center">
          <%= link "Sign In", to: "#" %>
          <%= link "Sign Up", to: "#", class: "py-2 px-4 rounded bg-violet-300 hover:bg-violet-400" %>
        </div>
      </div>

      <div class="visible md:invisible m-0 h-full space-x-4 h-10 flex flex-row items-center shadow-lg">
        <span class="ml-4 cursor-pointer">
          <i data-feather="menu" id="mobile-menu"></i>
        </span>

        <h1 class="text-3xl">Trivia Game</h1>
      </div>

      <div id="mobile-menu-list" class="mt-4 shadow-lg">
        <ul class="flex flex-col space-y-8">
          <li class="py-2 px-4"><%= link "Home", to: "#" %></li>
          <li class="py-2 px-4"><%= link "Sign In", to: "#" %></li>
          <li class="py-2 px-4 bg-violet-300 "><%= link "Sign Up", to: "#" %></li>
        </ul>
      </div>
    </nav>
    """
  end
end
