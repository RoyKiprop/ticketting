defmodule TickettingWeb.TicketDetails do
  use Phoenix.Component

  def ticket_info(assigns) do
    ~H"""
    <div class="px-4 py-28 md:py-24 bg-white max-w-[1500px] mx-auto">
      <div class="flex items-center mb-6">
        <.link navigate="/" class="text-blue-500 mr-4 hover:text-blue-700 transition-colors">
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="h-6 w-6"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M10 19l-7-7m0 0l7-7m-7 7h18"
            />
          </svg>
        </.link>
        <h1 class="text-2xl md:text-3xl font-bold text-gray-800">Ticket Options</h1>
      </div>

      <div>
        <div class="flex flex-col md:flex-row space-y-6 md:space-y-0 md:space-x-8">
          <div class="w-full md:w-2/5 mb-4 md:mb-0 h-[50vh] md:h-[70vh]">
            <img
              src={@event.image}
              alt="Event Poster"
              class="w-full h-full object-cover rounded-lg shadow-md"
            />
          </div>

          <div class="w-full md:w-3/5 space-y-4">
            <h2 class="text-2xl md:text-3xl font-bold text-gray-900"><%= @event.name %></h2>

            <div class="space-y-3 text-gray-700">
              <p class="flex items-center">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="h-5 w-5 mr-3 text-blue-500"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"
                  />
                </svg>
                <%= Timex.format!(@event.date, "{Mfull} {D}, {YYYY}") %>
              </p>

              <p class="flex items-center">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="h-5 w-5 mr-3 text-blue-500"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"
                  />
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"
                  />
                </svg>
                <%= @event.location %>
              </p>

              <p class="flex items-center">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="h-5 w-5 mr-3 text-blue-500"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
                  />
                </svg>
                <%= Timex.format!(@event.start_time, "{h12}:{0m} {am}") %> - <%= Timex.format!(
                  @event.end_time,
                  "{h12}:{0m} {am}"
                ) %>
              </p>
            </div>

            <div class="mt-4">
              <h3 class="text-xl font-bold mb-2 text-gray-900">Event Information</h3>
              <p class="text-gray-700 leading-relaxed">
                <%= @event.description %>
              </p>
            </div>

            <div class="my-4">
              <h2 class="font-semibold mb-2">Share</h2>
              <div class="flex justify-start space-x-4 text-[#312f7e]">
                <%= for {icon, link} <- [
                      {"facebook", "#"},
                      {"instagram", "#"},
                      {"twitter-x", "#"},
                      {"linkedin", "#"},
                      {"whatsapp", "#"}
                    ] do %>
                  <a href={link} class="hover:text-[#312f7e]/60 transition-colors text-xl">
                    <i class={"bi bi-#{icon}"}></i>
                  </a>
                <% end %>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end

  def price_options(assigns) do
    ~H"""
    <section class="w-full  bg-gray-50">
      <div class="grid grid-cols-1 md:grid-cols-3 gap-6 max-w-[1500px] mx-auto px-4 py-16">
        <%= for ticket <- @ticket_types do %>
          <div class="
            bg-white
            rounded
            shadow-md
            overflow-hidden

            border-l-4
            border-[#7fc8ff]
            flex
            flex-col
          ">
            <div class="p-6 text-center">
              <h2 class="text-2xl font-bold text-gray-800 mb-2"><%= ticket.name %></h2>
              <p class="text-gray-600 mb-4 text-xs"><%= ticket.description %></p>

              <div class="mb-4 text-gray-700">
                <p class="text-sm">
                  <span class="font-semibold">Valid From:</span>
                  <%= Timex.format!(ticket.activate_on, "{Mfull} {D}, {YYYY}") %>
                </p>
                <p class="text-sm">Starts at 04:00 PM</p>
              </div>

              <div class="text-3xl font-bold text-[#7fc8ff] mb-6">
                Ksh. <%= ticket.price %>
              </div>

              <button
                phx-click="buy-ticket"
                phx-value-type={ticket.name}
                class="
                  w-full
                  bg-[#7fc8ff]
                  text-white
                  font-bold
                  py-3
                  rounded-lg
                  hover:bg-[#7fc8ff]/60
                  transition
                  duration-300
                  ease-in-out
                  focus:outline-none
                  focus:ring-2
                  focus:ring-blue-400
                "
              >
                Buy Ticket
              </button>
            </div>
          </div>
        <% end %>
      </div>
    </section>
    """
  end

  def other_likes(assigns) do
    ~H"""
    <section class="w-full max-w-[1500px] mx-auto px-4 py-16 bg-white">
      <h2 class="text-3xl font-bold mb-8 text-gray-800">You May Also Like</h2>

      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
        <%= for random_event <- @random_events do %>
          <div class="bg-white shadow-lg  overflow-hidden">
            <div class="relative">
              <img src={random_event.image} alt={random_event.name} class="w-full h-72 object-cover" />
            </div>

            <div class="p-5">
              <h3 class="text-xl font-bold text-gray-800 mb-2 truncate">
                <%= random_event.name %>
              </h3>

              <div class="text-sm text-gray-600 space-y-1">
                <p>
                  <%= Timex.format!(random_event.start_time, "{h12}:{0m} {am}") %> - <%= Timex.format!(
                    random_event.end_time,
                    "{h12}:{0m} {am}"
                  ) %>
                </p>
                <p><%= Timex.format!(random_event.date, "{Mshort} {D}") %></p>

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
                  <p class="truncate"><%= random_event.location %></p>
                </div>
              </div>

              <button
                phx-click="view-event"
                phx-value-slug={random_event.slug}
                class="w-full mt-4 bg-[#7fc8ff] text-white py-2 rounded-lg hover:bg-[#7fc8ff]/60 transition duration-300 ease-in-out"
              >
                Get Tickets
              </button>
            </div>
          </div>
        <% end %>
      </div>
    </section>
    """
  end
end
