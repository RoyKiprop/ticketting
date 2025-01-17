defmodule TickettingWeb.EventsCompoents do
  use Phoenix.Component

  def events_hero(assigns) do
    ~H"""
    <div class="relative bg-gray-900 text-white ">
      <div class="absolute inset-0 overflow-hidden">
        <div class="relative h-full">
          <img
            src="/images/Events.png"
            alt="Events Banner"
            class="w-full h-[500px] object-cover opacity-60"
          />
        </div>
      </div>

      <div class="relative max-w-[1500px] mx-auto px-6 py-24 md:py-32">
        <div class="max-w-3xl">
          <h1 class="text-4xl md:text-5xl lg:text-6xl font-bold mb-6">
            Discover Amazing Events
          </h1>
          <p class="text-lg md:text-xl text-gray-300 mb-8 max-w-2xl">
            Find and book tickets for the most exciting events.
          </p>

          <div class="absolute left-0 right-0 bottom-0 transform translate-y-1/2 px-6 ">
            <div class="max-w-[1500px] mx-auto ">
              <div class="bg-[#7fc8ff] rounded-lg shadow-lg p-10">
                <form class="grid grid-cols-1 md:grid-cols-3 gap-6">
                  <div class="flex flex-col">
                    <label class="text-gray-600 mb-2">Search Event</label>
                    <input
                      type="text"
                      placeholder="Konser Jazz"
                      class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                    />
                  </div>

                  <div class="flex flex-col">
                    <label class="text-gray-600 mb-2">Place</label>
                    <input
                      type="text"
                      placeholder="Carnivore"
                      class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                    />
                  </div>

                  <div class="flex flex-col">
                    <label class="text-gray-600 mb-2">Time</label>
                    <div class="relative">
                      <input
                        type="text"
                        placeholder="Pick a date"
                        class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                      />
                      <div class="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none">
                        <svg
                          class="w-5 h-5 text-gray-400"
                          fill="none"
                          stroke="currentColor"
                          viewBox="0 0 24 24"
                        >
                          <path
                            stroke-linecap="round"
                            stroke-linejoin="round"
                            stroke-width="2"
                            d="M19 9l-7 7-7-7"
                          />
                        </svg>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>

          <div class="flex flex-col sm:flex-row gap-4">
            <button class="px-8 py-3 bg-[#7fc8ff] text-white font-semibold rounded-lg hover:bg-[#7fc8ff]/80 transition duration-300 ease-in-out transform hover:-translate-y-0.5">
              Browse Events
            </button>
            <button class="px-8 py-3 bg-transparent border-2 border-white text-white font-semibold rounded-lg hover:bg-white hover:text-gray-900 transition duration-300 ease-in-out transform hover:-translate-y-0.5">
              Create Event
            </button>
          </div>
        </div>
      </div>
    </div>
    """
  end

  def all_events(assigns) do
    ~H"""
    <div class="container max-w-[1500px] mx-auto px-4 py-20 md:py-28">
      <div class=" mb-8">
        <h2 class="text-lg md:text-3xl font-bold w-full">
          All Events
        </h2>
      </div>

      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
        <%= for event <- @active_events do %>
          <div class="bg-white shadow-lg  overflow-hidden">
            <div class="relative">
              <img src={event.image} alt={event.name} class="w-full h-72 object-cover" />
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
                class="w-full mt-4 bg-[#7fc8ff] text-white py-2 rounded-lg hover:bg-[#7fc8ff]/60 transition duration-300 ease-in-out"
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

  def steps(assigns) do
    ~H"""
    <div class="max-w-[1500px] mx-auto py-8 md:py-16 px-4">
      <div class="text-center mb-12">
        <h2 class="text-3xl md:text-5xl w-full md:w-[45%] mx-auto font-bold mb-4 leading-8">
          Discover and Purchase Your Event Tickets
        </h2>
        <p class="text-gray-600 w-full md:w-[60%] mx-auto text-md md:text-lg">
          Finding your next event is simple. Browse through our curated list of exciting events, and choose the one that catches your interest.
        </p>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div class="text-center mx-auto">
          <img src="/images/rec3.png" class="mb-4" alt="Select Your Favorite Event" />
          <h3 class="text-xl font-bold mb-2">Select Your Favorite Event</h3>
          <p class="text-gray-600">Click on the event to view details.</p>
        </div>

        <div class="text-center mx-auto">
          <img src="/images/rec1.png" class="mb-4" alt="Purchase Your Tickets Effortlessly" />
          <h3 class="text-xl font-bold mb-2">Purchase Your Tickets Effortlessly</h3>
          <p class="text-gray-600">Add tickets to your cart and proceed to checkout.</p>
        </div>

        <div class="text-center">
          <img src="/images/rec2.png" class="mb-4" alt="Enjoy Your Event with Ease" />
          <h3 class="text-xl font-bold mb-2">Enjoy Your Event with Ease</h3>
          <p class="text-gray-600 w-[85%] mx-auto">
            Complete your purchase and get ready for an unforgettable experience.
          </p>
        </div>
      </div>

      <div class="text-center mt-8">
        <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-6 rounded">
          Get Tickets
        </button>
      </div>
    </div>
    """
  end
end
