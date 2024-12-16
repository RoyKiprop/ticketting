defmodule TickettingWeb.Navigation do
  use Phoenix.Component
  alias Phoenix.LiveView.JS

  def navigation(assigns) do
    ~H"""
    <div class="bg-white ">
      <nav class="fixed top-0 left-0 right-0 z-50 bg-white ">
        <div class="flex items-center justify-between max-w-[1500px] mx-auto py-5 px-4 ">
          <div>
            <.link navigate="/">
              <img src="" alt="Logo" class="h-8 w-auto" />
            </.link>
          </div>

          <div class="hidden md:flex items-center space-x-8">
            <%= for link <- nav_links(@current_user) do %>
              <.nav_link name={link.name} link={link.link} />
            <% end %>
          </div>

          <div class="hidden md:flex items-center space-x-12">
            <.link navigate="#">
              <button class="bg-[#333333] text-white font-medium px-6 py-2 rounded-full  hover:bg-bg-[#333333]/60 transition">
                Buy Tickets
              </button>
            </.link>
            <.login_signUp current_user={@current_user} />
          </div>

          <.mobile_nav current_user={@current_user} />
        </div>
      </nav>
    </div>
    """
  end

  defp nav_links(current_user) do
    base_links = [
      %{name: "Home", link: "/"},
      %{name: "Events", link: "/all-events"},
      %{name: "About Us", link: "/about"},
      %{name: "Contact Us", link: "/#contact-us"}
    ]

    admin_link =
      if current_user && current_user.active do
        case current_user.role_id do
          1 -> [%{name: "Admin", link: "/super_admin/dashboard"}]
          2 -> [%{name: "Admin", link: "/admin/dashboard"}]
          3 -> [%{name: "Admin", link: "/admin/dashboard"}]
          _ -> []
        end
      else
        []
      end

    base_links ++ admin_link
  end

  defp nav_link(assigns) do
    ~H"""
    <.link
      navigate={@link}
      class="font-medium text-md md:text-base text-[#525560] hover:text-[#1E1E1E]"
    >
      <%= @name %>
    </.link>
    """
  end

  def mobile_nav(assigns) do
    ~H"""
    <div class="md:hidden">
      <button
        type="button"
        phx-click={toggle_mobile_menu()}
        class="p-2 text-black hover:bg-gray-200 rounded-md"
      >
        <svg
          class="h-12 w-12"
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke="currentColor"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            stroke-width="2"
            d="M4 6h16M4 12h16M4 18h16"
          />
        </svg>
      </button>

      <div
        id="mobile-menu"
        class="hidden fixed inset-0 bg-gray-900 bg-opacity-75 backdrop-blur-sm z-40"
        phx-click-away={hide_mobile_menu()}
      >
        <div class="fixed right-0 top-0 h-[75%] w-[260px] bg-[#030129] p-6 shadow-lg space-y-6">
          <div class="flex justify-end">
            <button phx-click={hide_mobile_menu()} class="text-gray-400 hover:text-white">
              <svg
                class="h-8 w-8"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M6 18L18 6M6 6l12 12"
                />
              </svg>
            </button>
          </div>

          <%= for link <- nav_links(@current_user) do %>
            <.link
              navigate={link.link}
              class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-lg font-medium block"
              phx-click={hide_mobile_menu()}
            >
              <%= link.name %>
            </.link>
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  def login_signUp(assigns) do
    ~H"""
    <%= if @current_user do %>
      <.link navigate="/users/log_out" method="delete" class="inline-block">
        <button class="px-6 py-2 bg-[#333333] hover:bg-[#333333]/60 text-white font-medium rounded-full transition-colors duration-300 ease-in-out">
          Log Out
        </button>
      </.link>
    <% else %>
      <.link navigate="/users/log_in" class="inline-block">
        <button class="px-6 py-3 bg-[#333333] hover:bg-[#333333]/60 text-white font-medium rounded-full transition-colors duration-300 ease-in-out">
          Log In
        </button>
      </.link>
    <% end %>
    """
  end

  defp toggle_mobile_menu() do
    JS.toggle(to: "#mobile-menu")
  end

  defp hide_mobile_menu() do
    JS.hide(to: "#mobile-menu")
  end

  def footer(assigns) do
    ~H"""
    <footer class="bg-[#7fc8ff] py-12 px-4">
      <div class="w-full max-w-[1500px] mx-auto grid grid-cols-1 md:grid-cols-4 gap-8 text-center md:text-left">
        <div class="md:col-span-1">
          <div class=" mb-4">
            <h2 class="text-2xl font-bold text-[#4C4D8B]">
              Events
            </h2>
          </div>

          <p class="text-[#4C4D8B] max-w-xs mx-auto md:mx-0 text-sm leading-relaxed">
            Event is a global self-service ticketing platform for live
            experiences that allows anyone to create, share, find, and attend
            events that fuel their passions and enrich their lives.
          </p>

          <div class="flex justify-center md:justify-start space-x-4 mt-6">
            <a
              href="#"
              class="text-white bg-[#3b5599] hover:bg-opacity-80 transition-colors duration-300
                     rounded-full h-10 w-10 flex items-center justify-center"
            >
              <i class="bi bi-facebook text-lg"></i>
            </a>

            <a
              href="#"
              class="text-white bg-black hover:bg-opacity-80 transition-colors duration-300
                     rounded-full h-10 w-10 flex items-center justify-center"
            >
              <i class="bi bi-twitter-x text-lg"></i>
            </a>

            <a
              href="#"
              class="text-white bg-[#0077B5] hover:bg-opacity-80 transition-colors duration-300
                     rounded-full h-10 w-10 flex items-center justify-center"
            >
              <i class="bi bi-linkedin text-lg"></i>
            </a>

            <a
              href="#"
              class="text-white bg-pink-600 hover:bg-opacity-80 transition-colors duration-300
                     rounded-full h-10 w-10 flex items-center justify-center"
            >
              <i class="bi bi-instagram text-lg"></i>
            </a>
          </div>
        </div>

        <div class="md:col-span-1">
          <h3 class="text-lg font-semibold text-[#4C4D8B] mb-4">Events</h3>
          <ul class="space-y-3 text-[#4C4D8B]">
            <%= for {label, link} <- [
              {"Home", "#"},
              {"Events", "#"},
              {"About Us", "#"},
              {"Contact Us", "#"}
            ] do %>
              <li>
                <a href={link} class="hover:text-blue-800 transition-colors">
                  <%= label %>
                </a>
              </li>
            <% end %>
          </ul>
        </div>

        <div class="md:col-span-1">
          <h3 class="text-lg font-semibold text-[#4C4D8B] mb-4">Contact Us</h3>
          <div class="space-y-3 text-[#4C4D8B]">
            <p>
              <span class="font-medium">Telephone:</span>
              <a href="tel:+254741363084" class="hover:text-blue-800 transition-colors">
                +254 700 000 000
              </a>
            </p>
            <p>
              <span class="font-medium">Email:</span>
              <a href="mailto:example@gmail.com" class="hover:text-blue-800 transition-colors">
                example@gmail.com
              </a>
            </p>
          </div>
        </div>

        <div class="md:col-span-1">
          <h3 class="text-lg font-semibold text-[#4C4D8B] mb-4">Follow Us</h3>
          <div class="flex justify-center md:justify-start space-x-4 text-[#4C4D8B]">
            <%= for {icon, link} <- [
              {"facebook", "#"},
              {"instagram", "#"},
              {"twitter-x", "#"},
              {"linkedin", "#"}
            ] do %>
              <a href={link} class="hover:text-blue-800 transition-colors text-xl">
                <i class={"bi bi-#{icon}"}></i>
              </a>
            <% end %>
          </div>
        </div>
      </div>

      <div class="border-t border-gray-600/30 max-w-[1500px] mx-auto mt-12 pt-6 text-center">
        <p class="text-[#4C4D8B] text-sm">
          Copyright © <%= Date.utc_today().year %> Roy Kiprop
        </p>
      </div>
    </footer>
    """
  end
end
