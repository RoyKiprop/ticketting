defmodule TickettingWeb.HomeComponents do
  use Phoenix.Component

  def hero(assigns) do
    ~H"""
    <div class="w-full bg-[#7FC7FF] min-h-[100vh] flex items-center">
      <div class="w-full max-w-[1500px] px-4 md:px-8 pb-10 mx-auto flex flex-col md:flex-row items-center">
        <div class="w-full md:w-1/2 order-2 md:order-1 space-y-6 text-center md:text-left">
          <h2 class="text-3xl md:text-5xl leading-tight font-bold  text-black">
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
        <h2 class="text-lg md:text-3xl font-bold w-full">
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

  def faqs(assigns) do
    ~H"""
    <div class="w-full max-w-[1500px] mx-auto px-4 py-16 md:py-20">
      <div class="flex flex-col md:flex-row items-center space-y-5 md:space-x-4 ">
        <div class="w-full md:w-2/5 text-center md:text-left">
          <h2 class="text-3xl md:text-4xl font-bold text-black mb-6 w-full md:w-[80%]">
            Frequently Asked Questions
          </h2>
          <p class="text-gray-600 mb-8 max-w-md mx-auto md:mx-0">
            Find quick answers to common questions about our events,
            ticketing process, and payment options.
          </p>
          <button
            phx-click="contact_support"
            class="bg-black text-white px-6 py-3 mb-2 rounded-full
                   hover:bg-black/60 transition duration-300
                   transform hover:scale-105"
          >
            Contact Support
          </button>
        </div>

        <div class="w-full md:w-3/5 space-y-4">
          <%= for {question, answer} <- faq_items() do %>
            <div
              class=" bg-white rounded shadow-xs border border-black
                     transition-all duration-300 ease-in-out"
              phx-click="toggle_faq"
              phx-value-question={question}
            >
              <div class="flex justify-between items-center p-6 cursor-pointer">
                <h3 class="text-lg font-semibold text-black">
                  <%= question %>
                </h3>
                <i class={[
                  "bi transition-transform duration-300",
                  if(@open_faq == question,
                    do: "bi-chevron-up",
                    else: "bi-chevron-down"
                  )
                ]} />
              </div>

              <%= if @open_faq == question do %>
                <div class="px-6 pb-6 text-gray-600 animate-fade-in">
                  <%= answer %>
                </div>
              <% end %>
            </div>
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  defp faq_items do
    [
      {"What if I need help?",
       "If you need help, our customer support team is available 24/7. You can reach us through our contact page or email. We're committed to providing timely and helpful assistance."},
      {"How do I buy tickets?",
       "You can purchase tickets directly through our website. Simply browse available events, select the one you're interested in, choose your tickets, and follow the checkout process."},
      {"Can I pay later?",
       "We currently don't offer a pay-later option. All tickets must be paid for at the time of purchase to secure your spot at the event. We accept multiple payment methods for your convenience."},
      {"Are tickets refundable?",
       "Our refund policy varies depending on the event. Generally, tickets are non-refundable but may be transferable. Please check the specific event details or contact our support team for more information."},
      {"What payment methods are accepted?",
       "We accept a wide range of payment methods including major credit/debit cards, PayPal, Apple Pay, Google Pay, and other mobile payment options. The available methods will be clearly displayed during checkout."}
    ]
  end

  def purchase_guide(assigns) do
    ~H"""
    <section class="w-full bg-white flex justify-center">
      <div class="w-full max-w-[1500px] px-4 py-16 md:py-20 ">
        <div class="text-center max-w-3xl mx-auto">
          <h2 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
            Your Guide to Hassle-Free Ticket Purchasing
          </h2>
          <p class="text-gray-600 text-base md:text-lg max-w-xl mx-auto">
            Buying tickets has never been simpler. With our seamless payment options, you can secure your spot now.
          </p>
        </div>

        <div class="mt-12 grid grid-cols-1 md:grid-cols-3 gap-8 lg:gap-12">
          <div class="purchase-step flex flex-col items-center text-center transition-all duration-300 hover:scale-105">
            <div class="mb-6 h-64 flex items-center justify-center">
              <img
                src="/images/upcoming.svg"
                alt="Browse Upcoming Events"
                class="max-h-full max-w-full object-contain"
              />
            </div>
            <div class="step-content">
              <h3 class="text-xl font-bold text-[#242565] mb-2">
                Step 1: Browse Upcoming Events
              </h3>
              <p class="text-gray-600 text-sm md:text-base">
                Explore our diverse range of events tailored for you.
              </p>
            </div>
          </div>

          <div class="purchase-step flex flex-col items-center text-center transition-all duration-300 hover:scale-105">
            <div class="mb-6 h-64 flex items-center justify-center">
              <img
                src="/images/tickets.svg"
                alt="Select Your Tickets"
                class="max-h-full max-w-full object-contain"
              />
            </div>
            <div class="step-content">
              <h3 class="text-xl font-bold text-[#242565] mb-2">
                Step 2: Select Your Tickets
              </h3>
              <p class="text-gray-600 text-sm md:text-base">
                Choose the tickets that best fit your needs.
              </p>
            </div>
          </div>

          <div class="purchase-step flex flex-col items-center text-center transition-all duration-300 hover:scale-105">
            <div class="mb-6 h-64 flex items-center justify-center">
              <img
                src="/images/checkout.svg"
                alt="Checkout with Pay Later"
                class="max-h-full max-w-full object-contain"
              />
            </div>
            <div class="step-content">
              <h3 class="text-xl font-bold text-[#242565] mb-2">
                Step 3: Checkout
              </h3>
              <p class="text-gray-600 text-sm md:text-base">
                Complete your purchase.
              </p>
            </div>
          </div>
        </div>

        <div class="mt-12 text-center">
          <a
            href="#"
            class="inline-block px-8 py-3 border-2 border-[#242565] text-[#242565] rounded-lg
                   hover:bg-[#242565] hover:text-white
                   transition-colors duration-300
                   text-base font-semibold"
          >
            Learn More
          </a>
        </div>
      </div>
    </section>
    """
  end

  def join_brands(assigns) do
    ~H"""
    <section class="w-full px-4 py-16 bg-white">
      <div class="w-full max-w-[1500px] mx-auto text-center">
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
    </section>
    """
  end
end
