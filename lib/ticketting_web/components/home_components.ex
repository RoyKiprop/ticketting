defmodule TickettingWeb.HomeComponents do
  use Phoenix.Component

  def hero(assigns) do
    ~H"""
    <div class="w-[100%] bg-[#7FC7FF] h-[100vh] ">
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
end
