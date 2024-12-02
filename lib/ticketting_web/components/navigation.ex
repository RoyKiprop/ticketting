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
end
