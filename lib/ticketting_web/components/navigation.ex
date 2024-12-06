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

  def footer(assigns) do
    ~H"""
    <footer class="bg-[#7fc8ff] py-8">
      <div class="w-[85%] mx-auto grid grid-cols-1 md:grid-cols-4 gap-4 text-center md:text-left text-sm text-gray-800">
        <div>
          <div class="flex items-center">
            <img src="/images/Event_tick.svg" />
            <h2 class="text-2xl font-bold flex items-center space-x-2 text-[#4C4D8B]">
              Eventick
            </h2>
          </div>
          <p class="mt-2 max-w-xs text-[#4C4D8B]">
            Eventick is a global self-service ticketing platform for live
            experiences that allows anyone to create, share, find, and attend
            events that fuel their passions and enrich their lives.
          </p>

          <div class="flex mt-4 space-x-4">
            <a
              href="#"
              class="flex items-center justify-center text-white rounded-full h-8 w-8 bg-[#3b5599]"
            >
              <i class="fab fa-facebook-f"></i>
            </a>
            <a
              href="#"
              class="flex items-center justify-center text-white rounded-full h-8 w-8 bg-[#5caff0]"
            >
              <i class="fab fa-twitter"></i>
            </a>
            <a
              href="#"
              class=" flex items-center justify-center text-white rounded-full h-8 w-8 bg-[#0177a7]"
            >
              <i class="fab fa-linkedin-in"></i>
            </a>
          </div>
        </div>

        <div>
          <h3 class="text-lg font-semibold text-[#4C4D8B]">Eventick</h3>
          <ul class="mt-2 space-y-2 text-[#4C4D8B]">
            <li>
              <a href="#" class="hover:underline">
                Home
              </a>
            </li>
            <li>
              <a href="#" class="hover:underline">
                Events
              </a>
            </li>
            <li>
              <a href="#" class="hover:underline">
                About Us
              </a>
            </li>
            <li>
              <a href="#" class="hover:underline">
                Contact Us
              </a>
            </li>
          </ul>
        </div>

        <div>
          <h3 class="text-lg font-semibold text-[#4C4D8B]">Contact Us</h3>
          <ul class="mt-2 space-y-2 text-[#4C4D8B]">
            <li>
              Telephone: <span class="font-semibold">+254741363084</span>
            </li>
            <li>
              Email:
              <a href="mailto:example@gmail.com" class="text-[#4C4D8B] hover:underline">
                <span class="font-semibold">example@gmail.com</span>
              </a>
            </li>
          </ul>
        </div>

        <div>
          <h3 class="text-lg font-semibold text-[#4C4D8B]">Social</h3>
          <div class="flex mt-2 space-x-4">
            <a href="#" class="text-[#4C4D8B]">
              <i class="fab fa-facebook-f"></i>
            </a>
            <a href="#" class="text-[#4C4D8B]">
              <i class="fab fa-instagram"></i>
            </a>
            <a href="#" class="text-[#4C4D8B]">
              <i class="fab fa-twitter"></i>
            </a>
            <a href="#" class="text-[#4C4D8B]">
              <i class="fab fa-youtube"></i>
            </a>
          </div>
        </div>
      </div>

      <div class="border-t border-gray-600 mx-40 mt-8 pt-4 text-center text-[#4C4D8B]">
        <p>Copyright © 2024 Pyraus Group</p>
      </div>
    </footer>
    """
  end
end
