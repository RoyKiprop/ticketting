defmodule TickettingWeb.Sidebar do
  use TickettingWeb, :live_component

  use TickettingWeb, :verified_routes

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <aside
      id="sidebar-multi-level-sidebar"
      class="fixed top-0 left-0 z-40 w-64 h-screen transition-transform -translate-x-full sm:translate-x-0"
      aria-label="Sidebar"
    >
      <div class="h-full px-3 py-4 overflow-y-auto bg-[#7fc8ff]">
        <ul class="space-y-2 font-medium">
          <li>
            <.link
              navigate={~p"/"}
              class="flex items-center p-2 text-gray-900 rounded-lg hover:text-white hover:bg-[#333331]  group"
            >
              <Heroicons.icon name="home" type="outline" class="h-4 w-4" />
              <span class="ms-3">Home</span>
            </.link>
          </li>
          <li>
            <.link
              navigate={~p"/dashboard"}
              class="flex items-center p-2 text-gray-900 rounded-lg hover:text-white hover:bg-[#333331]  group"
            >
              <Heroicons.icon name="chart-bar-square" type="outline" class="h-4 w-4" />
              <span class="ms-3">Dashboard</span>
            </.link>
          </li>

          <li>
            <.link
              navigate={~p"/events"}
              class="flex items-center p-2 text-gray-900 rounded-lg hover:text-white hover:bg-[#333331]  group"
            >
              <i class="bi bi-calendar-event"></i>
              <span class="flex-1 ms-3 whitespace-nowrap">Events</span>
            </.link>
          </li>

          <li>
            <.link
              navigate="/businesses"
              class="flex items-center p-2 text-gray-900 rounded-lg hover:text-white hover:bg-[#333331]  group"
            >
              <Heroicons.icon name="currency-dollar" type="outline" class="h-4 w-4" />
              <span class="flex-1 ms-3 whitespace-nowrap">Payments</span>
            </.link>
          </li>

          <li>
            <.link
              navigate="/tickets"
              class="flex items-center p-2 text-gray-900 rounded-lg hover:text-white hover:bg-[#333331]  group"
            >
              <i class="bi bi-ticket-detailed"></i>
              <span class="flex-1 ms-3 whitespace-nowrap">Tickets</span>
            </.link>
          </li>

          <li>
            <.link
              navigate="/ticket_types"
              class="flex items-center p-2 text-gray-900 rounded-lg hover:text-white hover:bg-[#333331]  group"
            >
              <Heroicons.icon name="rectangle-stack" type="outline" class="h-4 w-4" />
              <span class="flex-1 ms-3 whitespace-nowrap">Ticket Types</span>
            </.link>
          </li>

          <li>
            <.link
              navigate="/users"
              class="flex items-center p-2 text-gray-900 rounded-lg hover:text-white hover:bg-[#333331]  group"
            >
              <Heroicons.icon name="users" type="outline" class="h-4 w-4" />
              <span class="flex-1 ms-3 whitespace-nowrap">Users</span>
            </.link>
          </li>
          <li>
            <.link
              navigate="/roles"
              class="flex items-center p-2 text-gray-900 rounded-lg hover:text-white hover:bg-[#333331]  group"
            >
              <Heroicons.icon name="user-plus" type="outline" class="h-4 w-4" />
              <span class="flex-1 ms-3 whitespace-nowrap">Roles</span>
            </.link>
          </li>

          <li>
            <.link
              navigate="/permissions"
              class="flex items-center p-2 text-gray-900 rounded-lg hover:text-white hover:bg-[#333331]  group"
            >
              <Heroicons.icon name="key" type="outline" class="h-4 w-4" />
              <span class="flex-1 ms-3 whitespace-nowrap">Permissions</span>
            </.link>
          </li>

          <li>
            <.link
              navigate="/users/log_out"
              class="flex items-center p-2 text-gray-900 rounded-lg hover:text-white hover:bg-[#333331]  group"
            >
              <svg
                class="flex-shrink-0 w-5 h-5 text-gray-500 transition duration-75 hover:text-gray-400 group-hover:text-gray-900 hover:group-hover:text-white"
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 18 16"
              >
                <path
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M1 8h11m0 0L8 4m4 4-4 4m4-11h3a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-3"
                />
              </svg>
              <span class="flex-1 ms-3 whitespace-nowrap">Sign Out</span>
            </.link>
          </li>
        </ul>
      </div>
    </aside>
    """
  end
end
