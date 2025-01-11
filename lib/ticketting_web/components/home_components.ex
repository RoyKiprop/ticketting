defmodule TickettingWeb.HomeComponents do
  use Phoenix.Component

  def hero(assigns) do
    ~H"""
    <div class="relative w-full min-h-[100vh] bg-gradient-to-br from-[#7FC7FF] to-[#6AB3EB]">
      <div class="relative w-full max-w-[1500px] px-6 md:px-8 mx-auto min-h-screen">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
          <div class="space-y-8 text-center md:text-left order-2 md:order-1">
            <h1 class="text-4xl md:text-5xl  font-bold text-gray-900 leading-tight">
              Discover Your Next
              <span class="text-transparent bg-clip-text bg-gradient-to-r from-gray-900 to-gray-700">
                Unforgettable Event
              </span>
            </h1>

            <p class="text-gray-700 text-base md:text-lg max-w-xl mx-auto md:mx-0 leading-relaxed">
              Welcome to your one-stop destination for event ticketing! Discover exciting events,
              secure your tickets, and enjoy hassle-free payment options.
            </p>

            <div class="flex flex-col sm:flex-row items-center justify-center md:justify-start space-y-4 sm:space-y-0 sm:space-x-6">
              <.link
                navigate="/all-events"
                class="w-full sm:w-auto px-8 py-4 bg-gray-900 text-white rounded-full font-medium hover:bg-gray-800 transform hover:-translate-y-0.5 transition-all duration-200 shadow-lg hover:shadow-xl"
              >
                Explore Events
              </.link>
              <%= if @current_user && "add-events" in @permissions do %>
                <.link
                  navigate="/events"
                  class="w-full sm:w-auto px-8 py-4 border-2 border-gray-900 text-gray-900 rounded-full font-medium hover:bg-gray-900 hover:text-white transform hover:-translate-y-0.5 transition-all duration-200"
                >
                  Register An Event
                </.link>
              <% end %>
            </div>
          </div>

          <div class="w-full order-1 md:order-2 mb-8 md:mb-0">
            <.hero_images />
          </div>
        </div>
      </div>
    </div>
    """
  end

  def events(assigns) do
    ~H"""
    <div class="container max-w-[1500px] mx-auto px-4 py-12 md:py-16">
      <div class="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 md:gap-0 mb-12">
        <div class="space-y-2">
          <h2 class="text-2xl md:text-4xl font-bold text-gray-900 tracking-tight">
            Upcoming Events
          </h2>
          <p class="text-gray-500 text-sm md:text-base">
            Discover and book your next amazing experience
          </p>
        </div>
        <a
          href="#"
          class="group inline-flex items-center px-4 py-2 text-sm font-medium text-blue-600 hover:text-blue-800 transition-colors duration-200"
        >
          View All Events
          <svg
            class="ml-2 w-4 h-4 transform group-hover:translate-x-1 transition-transform duration-200"
            fill="none"
            stroke="currentColor"
            viewBox="0 0 24 24"
          >
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
          </svg>
        </a>
      </div>

      <%= if Enum.empty?(@upcoming_events) do %>
        <div class="flex flex-col items-center justify-center py-16 px-4 bg-gray-50 rounded-xl">
          <div class="w-24 h-24 mb-6 text-gray-300">
            <svg
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="1.5"
                d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"
              />
            </svg>
          </div>
          <h3 class="text-xl md:text-2xl font-semibold text-gray-900 mb-2 text-center">
            No Upcoming Events
          </h3>
          <p class="text-gray-500 text-center max-w-md mb-8">
            We're working on bringing you exciting new events. Check back soon or sign up for notifications.
          </p>
          <button class="inline-flex items-center px-6 py-3 bg-[#7fc8ff] hover:bg-blue-700 text-white font-medium rounded-lg transition-colors duration-200">
            Get Notified
            <svg class="ml-2 w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"
              />
            </svg>
          </button>
        </div>
      <% else %>
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8">
          <%= for event <- @upcoming_events do %>
            <div class="group bg-white rounded-xl shadow-sm hover:shadow-lg transition-all duration-300 overflow-hidden">
              <div class="relative aspect-[4/3] overflow-hidden">
                <img
                  src={event.image}
                  alt={event.name}
                  class="w-full h-full object-cover transform group-hover:scale-105 transition-transform duration-500"
                />
                <div class="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-300">
                </div>
              </div>

              <div class="p-6">
                <div class="flex items-center gap-2 mb-4">
                  <span class="px-3 py-1 text-xs font-medium bg-blue-100 text-blue-800 rounded-full">
                    <%= Timex.format!(event.date, "{Mshort} {D}") %>
                  </span>
                  <span class="text-sm text-gray-500">
                    <%= Timex.format!(event.start_time, "{h12}:{0m} {am}") %>
                  </span>
                </div>

                <h3 class="text-lg font-bold text-gray-900 mb-2 line-clamp-1 group-hover:text-blue-600 transition-colors duration-200">
                  <%= event.name %>
                </h3>

                <div class="flex items-center text-gray-500 text-sm mb-4">
                  <svg
                    class="w-4 h-4 mr-2 flex-shrink-0"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
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
                  <p class="truncate"><%= event.location %></p>
                </div>

                <button
                  phx-click="view-event"
                  phx-value-slug={event.slug}
                  class="w-full py-3 px-4 bg-blue-600 hover:bg-blue-700 text-white font-medium rounded-lg transition-colors duration-200 flex items-center justify-center gap-2"
                >
                  Get Tickets
                  <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M13 7l5 5m0 0l-5 5m5-5H6"
                    />
                  </svg>
                </button>
              </div>
            </div>
          <% end %>
        </div>
      <% end %>
    </div>
    """
  end

  defp hero_images(assigns) do
    ~H"""
    <div class="grid grid-cols-2 grid-rows-3 gap-2  h-[500px] md:h-[1000px] ">
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
    <section class="w-full px-4 py-8 md:pb-16 bg-white">
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
