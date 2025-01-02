defmodule TickettingWeb.Testimonials do
  use Phoenix.LiveComponent

  def mount(socket) do
    {:ok, assign(socket, current_index: 0)}
  end

  def handle_event("next", _params, socket) do
    testimonies = testimonials()
    current_index = socket.assigns.current_index
    new_index = if current_index >= length(testimonies) - 1, do: 0, else: current_index + 1

    {:noreply, assign(socket, current_index: new_index)}
  end

  def handle_event("prev", _params, socket) do
    testimonies = testimonials()
    current_index = socket.assigns.current_index
    new_index = if current_index <= 0, do: length(testimonies) - 1, else: current_index - 1
    {:noreply, assign(socket, current_index: new_index)}
  end

  def render(assigns) do
    ~H"""
    <section class="w-full py-16 md:py-24 bg-gradient-to-b from-gray-50 to-gray-100">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h2 class="text-3xl md:text-4xl font-bold text-center text-gray-900 mb-12">
          What Our Users Say
        </h2>

        <div class="relative max-w-3xl mx-auto px-12 md:px-16">
          <div class="absolute top-1/2 -translate-y-1/2 left-0 z-10">
            <button
              phx-click="prev"
              phx-target={@myself}
              class="p-2 rounded-full bg-white shadow-lg hover:bg-gray-50 transition-all duration-200"
              aria-label="Previous testimonial"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-6 w-6 md:h-8 md:w-8 text-gray-600"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7" />
              </svg>
            </button>
          </div>

          <div class="absolute top-1/2 -translate-y-1/2 right-0 z-10">
            <button
              phx-click="next"
              phx-target={@myself}
              class="p-2 rounded-full bg-white shadow-lg hover:bg-gray-50 transition-all duration-200"
              aria-label="Next testimonial"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-6 w-6 md:h-8 md:w-8 text-gray-600"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
              >
                <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
              </svg>
            </button>
          </div>

          <div class="bg-white rounded-2xl shadow-xl p-6 md:p-8 lg:p-10">
            <div class="flex flex-col items-center text-center">
              <div class="mb-6">
                <h3 class="text-xl md:text-2xl font-bold text-gray-900">
                  <%= Enum.at(testimonials(), @current_index).name %>
                </h3>
                <p class="text-sm md:text-base text-gray-600 mt-1">
                  <%= Enum.at(testimonials(), @current_index).title %>
                </p>
              </div>
              <p class="text-base md:text-lg text-gray-700 italic leading-relaxed">
                "<%= Enum.at(testimonials(), @current_index).text %>"
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
    """
  end

  defp testimonials do
    [
      %{
        name: "Mila McSabbu",
        title: "Event Coordinator",
        text:
          "The event ticketing experience was seamless and enjoyable. I can't wait to attend another event!"
      },
      %{
        name: "Alex Rodriguez",
        title: "Marketing Director",
        text:
          "An incredible platform that simplifies event management and ticket sales. Highly recommended for any event organizer!"
      },
      %{
        name: "Sarah Thompson",
        title: "Conference Planner",
        text:
          "The intuitive interface and robust features make this the best ticketing solution I've ever used."
      },
      %{
        name: "David Chen",
        title: "Tech Entrepreneur",
        text:
          "A game-changing service that revolutionizes how we think about event ticketing. Truly innovative and user-friendly!"
      }
    ]
  end
end
