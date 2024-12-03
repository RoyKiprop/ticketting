defmodule TickettingWeb.Navigation do
  use Phoenix.Component

  def navigation(assigns) do
    ~H"""
    <nav class="bg-white py-4">
      <div class=" mx-32 flex justify-between items-center">
        <div class="">
          <.link navigate="/">
            <img src="" alt="Logo" />
          </.link>
        </div>

        <div class="space-x-8 hidden md:flex">
          <.link class=" text-[#525560] hover:text-[#1E1E1E]" navigate="/">Home</.link>
          <.link class=" text-[#525560] hover:text-[#1E1E1E]" navigate="#">Events</.link>
          <.link class=" text-[#525560] hover:text-[#1E1E1E]" navigate="/about">About Us</.link>
          <.link class=" text-[#525560] hover:text-[#1E1E1E]" navigate="#">Contact</.link>
        </div>

        <div class="hidden md:block">
          <.link navigate="#">
            <button class="bg-[#1e1e1e] text-white font-bold px-6 py-3 rounded-full hover:bg-gray-800">
              Buy Tickets
            </button>
          </.link>
        </div>
      </div>
    </nav>
    """
  end

  def system_navbar(assigns) do
    ~H"""
    <ul class="relative z-10 flex items-center gap-4 px-4 sm:px-6 lg:px-8 justify-end">
      <%= if @current_user do %>
        <li>
          <.link
            navigate="/events"
            class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
          >
            Events Dashboard
          </.link>
          <.link
            navigate="/users/settings"
            class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
          >
            Settings
          </.link>
        </li>
        <li>
          <.link
            navigate="/users/log_out"
            method="delete"
            class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
          >
            Log out
          </.link>
        </li>
      <% else %>
        <li>
          <.link
            navigate="/users/log_in"
            class="text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-zinc-700"
          >
            Log in
          </.link>
        </li>
      <% end %>
    </ul>
    """
  end
end
