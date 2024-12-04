defmodule TickettingWeb.TicketDetails do
  use Phoenix.Component

  def ticket_info(assigns) do
    ~H"""
    <div class="px-6 py-20 bg-white md:px-12 lg:px-32">
      <div class="flex items-center mb-4">
        <.link navigate="/" class="text-blue-500 mr-5">
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
        <h1 class="text-2xl font-bold">Ticket Options</h1>
      </div>

      <div class="bg-white  md:mx-12 py-6">
        <div class="flex flex-col md:flex-row">
          <div class="w-full md:w-2/5 mb-4 md:mb-0 h-[60vh]">
            <img src={@event.image} alt="Event Poster" class="w-full h-full" />
          </div>

          <div class="w-full md:w-1/2 md:pl-4">
            <h2 class="text-xl font-bold mb-2"><%= @event.name %></h2>
            <p class="mb-2">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-5 w-5 inline mr-2"
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
            <p class="mb-2">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-5 w-5 inline mr-2"
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
            <p class="mb-4">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-5 w-5 inline mr-2"
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

            <h3 class="font-bold mb-2">Event Information</h3>
            <p class="text-md">
              <%= @event.description %>
            </p>
            <div class="">
              <h2 class="font-semibold mb-2">Share</h2>
              <div class="flex space-X-8">
                <a href="#" class="text-blue-500" title="Copy Link">
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
                      d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1"
                    />
                  </svg>
                </a>
                <a
                  href="https://www.instagram.com/share"
                  target="_blank"
                  rel="noopener noreferrer"
                  class="text-blue-500"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-6 w-6"
                    fill="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z" />
                  </svg>
                </a>
                <a
                  href="https://twitter.com/intent/tweet"
                  target="_blank"
                  rel="noopener noreferrer"
                  class="text-blue-500"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-6 w-6"
                    fill="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path d="M24 4.557c-.883.392-1.832.656-2.828.775 1.017-.609 1.798-1.574 2.165-2.724-.951.564-2.005.974-3.127 1.195-.897-.957-2.178-1.555-3.594-1.555-3.179 0-5.515 2.966-4.797 6.045-4.091-.205-7.719-2.165-10.148-5.144-1.29 2.213-.669 5.108 1.523 6.574-.806-.026-1.566-.247-2.229-.616-.054 2.281 1.581 4.415 3.949 4.89-.693.188-1.452.232-2.224.084.626 1.956 2.444 3.379 4.6 3.419-2.07 1.623-4.678 2.348-7.29 2.04 2.179 1.397 4.768 2.212 7.548 2.212 9.142 0 14.307-7.721 13.995-14.646.962-.695 1.797-1.562 2.457-2.549z" />
                  </svg>
                </a>
                <a
                  href="https://www.facebook.com/sharer/sharer.php"
                  target="_blank"
                  rel="noopener noreferrer"
                  class="text-blue-500"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-6 w-6"
                    fill="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path d="M9 8h-3v4h3v12h5v-12h3.642l.358-4h-4v-1.667c0-.955.192-1.333 1.115-1.333h2.885v-5h-3.808c-3.596 0-5.192 1.583-5.192 4.615v3.385z" />
                  </svg>
                </a>
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
    <div class="px-6 py-20 bg-gray-100 md:px-12 lg:px-32">
      <div class="space-y-5 bg-white shadow-lg rounded-lg px-5 py-8 max-w-xs group hover:border-b-[#7fc8ff] hover:border-r-[#7fc8ff] border-transparent border-b-4 border-r-4 transition-all">
        <h2 class="text-3xl font-bold mb-2 text-center">Early Bird</h2>
        <div>
          <p class="text-md text-gray-600 text-center">Valid on Sat, Oct 19, 2024</p>
          <p class="text-md text-gray-600 text-center mb-4">Starts on 04:00 PM</p>
        </div>

        <p class="text-3xl font-semibold text-center mb-4">Ksh. 800</p>
        <button class="bg-blue-500 text-white font-bold py-2 px-4 rounded w-full hover:bg-blue-600">
          Book Your Ticket
        </button>
      </div>
    </div>
    """
  end

  def other_likes(assigns) do
    ~H"""
    <div class="px-6 py-20 bg-white md:px-12 lg:px-32">
      <h2 class="text-3xl font-bold mb-4">You may also like</h2>
      <!--Other likes Section -->
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <div class="bg-white shadow-xl rounded-lg overflow-hidden group hover:border-b-[#7fc8ff] hover:border-r-[#7fc8ff] border-b-4 border-r-4 border-transparent">
          <div class="relative">
            <img src="/images/Obinna.svg" alt="" class="w-full h-48 object-cover" />
          </div>
          <div class="p-4">
            <div class="flex space-x-4 items-center mb-2">
              <div>
                <span class="text-gray-600 text-center text-md font-semibold">
                  NOV 01
                </span>
              </div>

              <div>
                <h3 class="text-xl font-bold text-gray-800 mb-1 ">
                  NAKURU MOTOR CLUB 1ST ANNIVERSARY
                </h3>
                <p class="text-gray-600 text-md mb-2 ">Ksh. 4500 - 9750</p>
                <div class="flex space-x-1">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-4 w-4 mr-1"
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
                  <p class="text-gray-600 text-md">MTONI CAMP, GILGIL</p>
                </div>
              </div>
            </div>

            <button class="w-[35%] mt-3 bg-blue-500 text-white py-2 rounded hover:bg-blue-600 transition duration-300">
              Get Tickets
            </button>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
