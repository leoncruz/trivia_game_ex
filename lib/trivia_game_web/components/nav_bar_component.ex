defmodule TriviaGameWeb.Components.NavBarComponent do
  use Phoenix.Component
  use Phoenix.HTML
  alias TriviaGameWeb.Router.Helpers, as: Routes

  def nav(assigns) do
    ~H"""
    <nav class="h-2 w-screen md:h-16 shadow-lg">
      <div class="h-full invisible md:visible flex items-center justify-between mx-16">
        <%= link "Home", to: Routes.home_path(@conn, :index) %>

        <h1 class="text-4xl">Trivia Game</h1>

        <div class="flex flex-row space-x-8 items-center">
          <%= if @current_user do %>
            <%= link "Settings", to: Routes.user_settings_path(@conn, :edit) %>
            <%= link "Log out", to: Routes.user_session_path(@conn, :delete), method: :delete,
              class: "py-2 px-4 rounded text-white bg-violet-500 hover:bg-violet-400 active:bg-violet-400"
            %>
          <% else %>
            <%= link "Sign In", to: Routes.user_session_path(@conn, :new) %>
            <%= link "Sign Up", to: Routes.user_registration_path(@conn, :new),
              class: "py-2 px-4 rounded text-white bg-violet-500 hover:bg-violet-400 active:bg-violet-400"
            %>
          <% end %>
        </div>
      </div>

      <div class="visible md:invisible m-0 h-full space-x-4 h-10 flex flex-row items-center shadow-lg">
        <span class="ml-4 cursor-pointer">
          <i data-feather="menu" id="mobile-menu"></i>
        </span>

        <h1 class="text-3xl">Trivia Game</h1>
      </div>

      <div id="mobile-menu-list" class="invisible mt-4 shadow-lg">
        <ul class="flex flex-col space-y-8">
          <li class="py-2 px-4"><%= link "Home", to: Routes.home_path(@conn, :index) %></li>
          <%= if @current_user do %>
            <li class="py-2 px-4"><%= link "Settings", to: Routes.user_settings_path(@conn, :edit) %></li>
            <li class="py-2 px-4 text-white bg-violet-500 hover:bg-violet-400 active:bg-violet-400 ">
              <%= link "Log out", to: Routes.user_session_path(@conn, :delete) %>
            </li>
          <% else %>
            <li class="py-2 px-4"><%= link "Sign In", to: Routes.user_session_path(@conn, :new) %></li>
            <li class="py-2 px-4 text-white bg-violet-500 hover:bg-violet-400 active:bg-violet-400 ">
              <%= link "Sign Up", to: Routes.user_registration_path(@conn, :new) %>
            </li>
          <% end %>
        </ul>
      </div>
    </nav>
    """
  end
end
