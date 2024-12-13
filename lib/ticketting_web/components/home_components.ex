defmodule TickettingWeb.HomeComponents do
  use Phoenix.Component

  def hero(assigns) do
    ~H"""
    <div class="w-full bg-[#7FC7FF] min-h-[100vh] flex items-center">
      <div class="w-full max-w-[1500px] px-4 md:px-8 mx-auto flex flex-col md:flex-row items-center">
        <div class="w-full md:w-1/2 order-2 md:order-1 space-y-6 text-center md:text-left">
          <h2 class="text-3xl md:text-5xl leading-loose font-bold  text-black">
            Discover Your Next Unforgettable Event Experience
          </h2>

          <p class="text-[#525560] text-base md:text-lg max-w-xl mx-auto md:mx-0">
            Welcome to your one-stop destination for event ticketing! Discover exciting events,
            secure your tickets, and enjoy hassle-free payment options.
          </p>

          <div class="flex justify-center md:justify-start space-x-4">
            <a
              href="#"
              class="px-6 py-3 bg-[#333333] text-white rounded-full hover:bg-gray-800 transition-colors"
            >
              Buy Tickets
            </a>
            <a
              href="#"
              class="px-6 py-3 border-2 border-black text-[#333333] rounded-full hover:bg-gray-100 transition-colors"
            >
              Register An Event
            </a>
          </div>
        </div>

        <div class="w-full md:w-1/2 order-1 md:order-2 mb-10 md:mb-0">
          <.hero_images />
        </div>
      </div>
    </div>
    """
  end

  def events(assigns) do
    ~H"""
    <div class="container max-w-[1500px] mx-auto px-4 py-12 md:py-16">
      <div class="flex flex-row justify-between items-center mb-8">
        <h2 class="text-xl md:text-3xl font-bold w-full">
          Upcoming Events
        </h2>
        <a
          href="#"
          class="inline-block text-blue-500 flex items-center justify-end hover:text-blue-700 w-full"
        >
          View All <i class="bi bi-arrow-right ml-2"></i>
        </a>
      </div>

      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
        <%= for event <- @upcoming_events do %>
          <div class="bg-white shadow-lg  overflow-hidden">
            <div class="relative">
              <img src={event.image} alt={event.name} class="w-full h-64 object-cover" />
            </div>

            <div class="p-5">
              <h3 class="text-xl font-bold text-gray-800 mb-2 truncate">
                <%= event.name %>
              </h3>

              <div class="text-sm text-gray-600 space-y-1">
                <p>
                  <%= Timex.format!(event.start_time, "{h12}:{0m} {am}") %> - <%= Timex.format!(
                    event.end_time,
                    "{h12}:{0m} {am}"
                  ) %>
                </p>
                <p><%= Timex.format!(event.date, "{Mshort} {D}") %></p>

                <div class="flex items-center mt-2">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-5 w-5 mr-2 text-gray-500"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      strokeWidth={2}
                      d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"
                    />
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      strokeWidth={2}
                      d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"
                    />
                  </svg>
                  <p class="truncate"><%= event.location %></p>
                </div>
              </div>

              <button
                phx-click="view-event"
                phx-value-slug={event.slug}
                class="w-full mt-4 bg-blue-500 text-white py-2 rounded-lg hover:bg-blue-600 transition duration-300 ease-in-out"
              >
                Get Tickets
              </button>
            </div>
          </div>
        <% end %>
      </div>
    </div>
    """
  end

  defp hero_images(assigns) do
    ~H"""
    <div class="grid grid-cols-2 grid-rows-3 gap-2  h-[500px] md:h-[950px]">
      <%= for image <- images() do %>
        <img src={image} alt="Event Image" class="w-full h-full object-cover" />
      <% end %>
    </div>
    """
  end

  defp images do
    [
      "/images/hero1.png",
      "/images/hero2.png",
      "/images/hero3.png",
      "/images/hero4.png",
      "/images/hero5.png",
      "/images/hero6.png"
    ]
  end
end
