defmodule TickettingWeb.AboutComponents do
  use Phoenix.Component
  use Gettext, backend: TickettingWeb.Gettext

  def aboutHero(assigns) do
    ~H"""
    <section class="relative bg-gray-900 text-white mt-20">
      <div class="absolute inset-0 overflow-hidden">
        <div class="relative h-full">
          <img
            src="/images/About.png"
            alt="About Banner"
            class="w-full h-[500px] object-cover opacity-60"
          />
        </div>
      </div>

      <div class="relative max-w-[1500px] mx-auto px-6 py-24 md:py-32">
        <div class="grid md:grid-cols-2 gap-8">
          <div>
            <h1 class="text-4xl md:text-5xl lg:text-6xl font-bold mb-6">
              Your Event Partner
            </h1>
          </div>

          <div>
            <p class="text-lg md:text-xl text-gray-300 mb-8">
              At <span class="text-[#7fc8ff] font-bold">Events</span>
              Ticketing, we are dedicated to transforming the way you experience events.
              Our team is passionate about creating seamless ticketing solutions that empower both organizers and attendees.
            </p>

            <a
              href="#join"
              class="inline-block px-8 py-3 bg-[#7fc8ff] text-white font-semibold rounded-lg hover:bg-[#7fc8ff]/80 transition duration-300"
            >
              Join us
            </a>
          </div>
        </div>
      </div>
    </section>
    """
  end

  def sectionOne(assigns) do
    ~H"""
    <section class="max-w-[1500px] mx-auto px-6 py-16">
      <div class="grid md:grid-cols-2 gap-8 mb-12">
        <div>
          <h2 class="text-3xl md:text-4xl font-bold text-gray-800 mb-6">
            Empowering unforgettable experiences through seamless event ticketing solutions.
          </h2>
        </div>

        <div>
          <p class="text-lg md:text-xl text-gray-600">
            At Events Ticketing, our mission is to simplify the event experience for both organizers and attendees.
            We envision a world where purchasing tickets is effortless, allowing everyone to focus on enjoying the event.
            With a dedicated team of passionate professionals, we bring years of expertise to ensure every event is a memorable success.
          </p>
        </div>
      </div>

      <div>
        <img src="/images/AboutSecTwo.svg" alt="Event Image" class="w-full rounded-lg shadow-md" />
      </div>
    </section>
    """
  end
end
