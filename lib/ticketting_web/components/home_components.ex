defmodule TickettingWeb.HomeComponents do
  use Phoenix.Component

  def hero(assigns) do
    ~H"""
    <div class="w-[100%] bg-[#7FC7FF] h-[90vh] ">
      <div class="w-[85%] flex justify-between items-center h-[100vh]  mx-auto">
        <div class="w-[45%] h-[100%] flex flex-col gap-8 justify-center items-start">
          <div class="">
            <h2 class="text-[56px] font-bold leading-[56px] text-black">
              Discover Your Next Unforgettable Event Experience
            </h2>
          </div>

          <div className="space-y-4 flex gap-8 items-center">
            <p class=" text-[#525560] text-lg  max-w-2xl">
              Welcome to your one-stop destination for event ticketing! Discover exciting events, secure your tickets, and enjoy hassle-free payment options.
            </p>
            <div class="flex mt-5 gap-6  text-sm">
              <a href="#" class="px-6 py-3 bg-[#333333] text-white rounded-full hover:bg-gray-800">
                Buy Tickets
              </a>
              <a
                href="#"
                class="px-6 py-3 border-[2px] border-black text-[#333333] rounded-full hover:bg-gray-100"
              >
                Register An Event
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end

  def events(assigns) do
    ~H"""
    <div class="container mx-28 my-8">
      <div class="flex justify-between items-center mb-6">
        <h2 class="text-3xl font-bold">Upcoming Events</h2>
        <a href="#" class="text-blue-300 flex items-center hover:text-blue-700">
          View All <i class="bi bi-arrow-right"></i>
        </a>
      </div>
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
        <div class="bg-white shadow-xl rounded-lg overflow-hidden">
          <div class="relative">
            <img src={Obinna} alt="" class="w-full h-48 object-cover" />
          </div>
          <div class="p-4">
            <div class="space-y-2 items-center mb-2">
              <h3 class="text-xl font-bold text-gray-800 mb-1 ">
                NAKURU MOTOR CLUB 1ST ANNIVERSARY
              </h3>
              <p class="text-gray-600 text-sm mb-2 ">Ksh. 4500 - 9750</p>
              <div class="flex items-center space-x-1">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="h-5 w-5 mr-1"
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
                <p class="text-gray-600 text-sm ">MTONI CAMP, GILGIL</p>
              </div>
              <div>
                <span class="text-gray-600 text-center text-sm ">
                  NOV 01
                </span>
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
