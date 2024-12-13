defmodule TkkWeb.HomeComponents do
  use Phoenix.Component

  use Gettext, backend: TkkWeb.Gettext

  def landing_page(assigns) do
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

        <div class="w-[45%] flex h-[100vh] overflow-none flex-row justify-between">
          <div class="w-[49%] h-[100%]">
            <.first_home_images />
          </div>

          <div class="w-[49%] h-[100%]">
            <.second_home_images />
          </div>
        </div>
      </div>
    </div>
    """
  end

  def active_events_on_home_page(assigns) do
    ~H"""
    <div class="w-[85%] mx-auto m-8 flex justify-center items-center">
      <div class="grid w-[100%] grid-cols-3 gap-8">
        <%= for event <- @active_events do %>
          <.link navigate={"/event/#{event.slug}"}>
            <.event_card event={event} />
          </.link>
        <% end %>
      </div>
    </div>
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
              Telephone: <span class="font-semibold">+254741363084</span>{" "}
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

  def join_brands(assigns) do
    ~H"""
    <div class="w-[85%] mx-auto px-4 py-16 text-center">
      <h2 class="text-3xl font-bold text-indigo-900 mb-8">
        Join these brands
      </h2>
      <p class="text-gray-600 mb-16 max-w-2xl mx-auto">
        We've had the pleasure of working with industry-defining brands. These
        are just some of them.
      </p>
      <div class="flex flex-wrap justify-center items-center gap-8 md:gap-16">
        <img src="/images/Safaricom.svg" alt="Safaricom" class="h-10 md:h-16 object-contain" />
        <img src="/images/Airtel.svg" alt="Airtel" class="h-10 md:h-16 object-contain" />
        <img src="/images/Betika.svg" alt="Betika" class="h-10 md:h-16 object-contain" />
        <img src="/images/Youtube.svg" alt="YouTube" class="h-10 md:h-16 object-contain" />
        <img src="/images/Microsoft.svg" alt="Microsoft" class="h-10 md:h-16 object-contain" />
      </div>
    </div>
    """
  end

  def faqs(assigns) do
    ~H"""
    <div class="w-[85%] mx-auto px-4 py-12 flex flex-col md:flex-row">
      <div class="md:w-1/3 mb-8 md:mb-0">
        <h2 class="text-4xl font-bold mb-4">FAQ</h2>
        <p class="text-gray-600 mb-6">
          Find answers to your questions about our events, ticketing, and
          payment options here.
        </p>
        <button class="bg-blue-500 text-white px-6 py-2 rounded-full hover:bg-gray-800 transition duration-300">
          Contact Us
        </button>
      </div>
      <div class="md:w-2/3 md:pl-12">
        <div class="border-b border-gray-200 py-4">
          <div class="flex justify-between items-center">
            <h3 class="text-lg font-semibold">What if I need help?</h3>
          </div>
          <div class="hidden">
            <p class="text-gray-600 mt-2">
              If you need help, our customer support team is available 24/7. You
              can reach us through our contact page or live chat.
            </p>
          </div>
        </div>
        <div class="border-b border-gray-200 py-4">
          <div class="flex justify-between items-center">
            <h3 class="text-lg font-semibold">How do I buy tickets?</h3>
          </div>
          <div class="hidden">
            <p class="text-gray-600 mt-2">
              You can purchase tickets directly through our website. Simply
              select the event you're interested in and follow the prompts to
              complete your purchase.
            </p>
          </div>
        </div>
        <div class="border-b border-gray-200 py-4">
          <div class="flex justify-between items-center">
            <h3 class="text-lg font-semibold">Can I pay later?</h3>
          </div>
          <div class="hidden">
            <p class="text-gray-600 mt-2">
              We currently don't offer a pay-later option. All tickets must be
              paid for at the time of purchase to secure your spot at the event.
            </p>
          </div>
        </div>
        <div class="border-b border-gray-200 py-4">
          <div class="flex justify-between items-center">
            <h3 class="text-lg font-semibold">Are tickets refundable?</h3>
          </div>
          <div class="hidden">
            <p class="text-gray-600 mt-2">
              Our refund policy varies depending on the event. Generally,
              tickets are non-refundable, but may be transferable. Please check
              the specific event details for more information.
            </p>
          </div>
        </div>
        <div class="border-b border-gray-200 py-4">
          <div class="flex justify-between items-center">
            <h3 class="text-lg font-semibold">
              What payment methods are accepted?
            </h3>
          </div>
          <div class="hidden">
            <p class="text-gray-600 mt-2">
              We accept various payment methods including credit/debit cards,
              PayPal, and mobile payment options. The available methods will be
              displayed at checkout.
            </p>
          </div>
        </div>
      </div>
    </div>
    """
  end

  def purchase_guide(assigns) do
    ~H"""
    <section class="bg-white py-12">
      <div class="w-[85%] mx-auto">
        <h2 class="text-2xl text-center md:text-3xl font-bold text-black">
          Your Guide to Hassle-Free Ticket Purchasing
        </h2>
        <p class="text-[#525560] text-center mt-4 w-[35%] mx-auto">
          Buying tickets has never been simpler. With our pay later option, you
          can secure your spot now and worry about payment later.
        </p>

        <div class="mt-12 grid grid-cols-1 md:grid-cols-3 gap-8">
          <div class="flex flex-col items-center text-center">
            <img
              src="/images/upcoming.svg"
              alt="Browse Upcoming Events"
              class="h-64 object-cover mb-4"
            />
            <h3 class="text-lg font-bold text-[#242565]">
              Step 1: Browse Upcoming Events
            </h3>
            <p class="text-[#525560] mt-2">
              Explore our diverse range of events tailored for you.
            </p>
          </div>

          <div class="flex flex-col items-center text-center">
            <img src="/images/tickets.svg" alt="Select Your Tickets" class="h-72 object-cover mb-4" />
            <h3 class="text-lg font-bold text-[#242565]">
              Step 2: Select Your Tickets
            </h3>
            <p class="text-[#525560] mt-2">
              Choose the tickets that best fit your needs.
            </p>
          </div>

          <div class="flex flex-col items-center text-center">
            <img
              src="/images/checkout.svg"
              alt="Checkout with Pay Later"
              class="h-64 object-cover mb-4"
            />
            <h3 class="text-lg font-bold text-[#242565]">
              Step 3: Checkout with Pay Later Option or Pay in Full
            </h3>
            <p class="text-[#525560] mt-2">
              Complete your purchase now and pay later with ease or pay in full
            </p>
          </div>
        </div>

        <div class="mt-12 text-center">
          <a href="#" class="px-8 py-3 border border-black rounded-lg text-black hover:bg-gray-100">
            Learn More
          </a>
        </div>
      </div>
    </section>
    """
  end

  def event_card(assigns) do
    ~H"""
    <div class="bg-white shadow-xl hover:scale-105 transition-all ease-in-out duration-500 rounded-lg overflow-hidden">
      <div class="relative">
        <img src={@event.poster_image} alt="" class="w-full h-[300px] object-cover" />
      </div>
      <div class="p-4">
        <div class="flex space-x-4 items-center mb-2">
          <div class="flex flex-col gap-1 items-center">
            <span class="text-gray-600 text-center text-3xl font-semibold">
              <%= format_date_to_month(@event.date) %>
            </span>
            <span class="text-gray-600 text-center text-3xl font-semibold">
              <%= format_date_to_day(@event.date) %>
            </span>
          </div>

          <div>
            <h3 class="text-2xl font-bold text-gray-800 mb-1 ">
              <%= @event.name %>
            </h3>
            <p class="text-gray-600 text-sm mb-2 ">Ksh. 4500 - 9750</p>
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
              <p class="text-gray-600 text-sm"><%= @event.location %></p>
            </div>
          </div>
        </div>
        <p>
          <%= truncate_string(@event.description, 100) %>
        </p>

        <button class="w-[35%] mt-3 bg-blue-500 text-white py-2 rounded hover:bg-blue-600 transition duration-300">
          Get Tickets
        </button>
      </div>
    </div>
    """
  end

  defp first_home_images(assigns) do
    ~H"""
    <div class="w-[100%] h-[100vh] flex flex-col gap-4 justify-between">
      <%= for image <- first_home_images() do %>
        <img src={image} alt="Event Image" class="w-[100%] h-[33%] object-cover" />
      <% end %>
    </div>
    """
  end

  defp second_home_images(assigns) do
    ~H"""
    <div class="w-[100%] flex h-[100vh] flex-col gap-12 justify-between">
      <%= for image <- second_home_images() do %>
        <img src={image} alt="Event Image" class="w-[100%] h-[30%]  object-cover" />
      <% end %>
    </div>
    """
  end

  defp format_date_to_month(date) do
    date
    |> Timex.format!("{Mshort}")
  end

  defp format_date_to_day(date) do
    date
    |> Timex.format!("{D}")
  end

  defp truncate_string(string, length) do
    if String.length(string) > length do
      string
      |> String.slice(0, length)
      |> String.trim_trailing()
      |> String.replace(~r/\s+\S*$/, "...")
    else
      string
    end
  end

  defp first_home_images do
    [
      "/images/home1.png",
      "/images/home2.png",
      "/images/home3.png"
    ]
  end

  defp second_home_images do
    [
      "/images/home4.png",
      "/images/home5.png",
      "/images/home6.png"
    ]
  end
end
