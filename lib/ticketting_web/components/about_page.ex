defmodule TickettingWeb.AboutComponents do
  use Phoenix.Component
  use Gettext, backend: TickettingWeb.Gettext

  def aboutHero(assigns) do
    ~H"""
    <section
      class="relative w-full max-w-[1500px] mx-auto h-[400px] lg:h-[500px] bg-cover bg-center text-white"
      style="background-image: url('/images/About.svg');"
    >
      <div class="absolute inset-0">
        <div class="container mx-auto px-4 lg:px-16 h-full flex items-center">
          <div class="w-full flex flex-col lg:flex-row items-center space-y-6 lg:space-y-0 lg:space-x-12">
            <div class="w-full lg:w-1/2">
              <h1 class="text-4xl lg:text-6xl font-bold tracking-tight leading-tight mb-4 text-center lg:text-left">
                Your Event Partner
              </h1>
            </div>

            <div class="w-full lg:w-1/2 flex flex-col items-center lg:items-start space-y-6 text-center lg:text-left">
              <p class="text-lg lg:text-xl max-w-[600px] opacity-90">
                At <strong class="font-bold text-blue-300">Events</strong>
                Ticketing, we are dedicated to transforming the way you experience events.
                Our team is passionate about creating seamless ticketing solutions that empower both organizers and attendees.
              </p>

              <a
                href="#join"
                class="inline-block bg-blue-500 hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-opacity-75
                       text-white text-base lg:text-lg px-8 py-3 rounded-lg
                       transition-all duration-300 ease-in-out
                       transform hover:-translate-y-1 hover:scale-105
                       shadow-md hover:shadow-lg"
              >
                Join us
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>
    """
  end

  def sectionOne(assigns) do
    ~H"""
    <section class="w-full max-w-[1500px] mx-auto px-6 py-8 md:py-12 bg-white md:px-12 lg:px-24 xl:px-32">
      <div class="container mx-auto">
        <div class="flex flex-col md:flex-row items-center space-y-8 md:space-y-0 md:space-x-12 lg:space-x-16">
          <div class="w-full md:w-1/2">
            <h1 class="text-3xl sm:text-4xl md:text-5xl font-bold mb-6 text-gray-800 leading-tight">
              Empowering unforgettable experiences through seamless event ticketing solutions.
            </h1>
          </div>

          <div class="w-full md:w-1/2">
            <p class="sm:text-xl md:text-2xl text-gray-700 leading-relaxed">
              At Events Ticketing, our mission is to simplify the event experience for both organizers and attendees. We envision a world where purchasing tickets is effortless, allowing everyone to focus on enjoying the event. With a dedicated team of passionate professionals, we bring years of expertise to ensure every event is a memorable success.
            </p>
          </div>
        </div>

        <div class="mt-12 md:mt-16 lg:mt-20 overflow-hidden">
          <img
            src="/images/AboutSecTwo.svg"
            alt="Event Image"
            class="w-full h-auto rounded-2xl shadow-xl transform transition-transform duration-300 hover:scale-[1.02]"
          />
        </div>
      </div>
    </section>
    """
  end
end
