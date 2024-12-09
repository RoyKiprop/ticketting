defmodule TickettingWeb.SidebarComponents do
  use Phoenix.Component

  use Gettext, backend: TkkWeb.Gettext

  def super_admin_sidebar(assigns) do
    ~H"""
    <div class="w-[18%] p-5 h-[100vh] bg-white shadow-sm shadow-gray-400">
      <%= for slot <- super_admin_sidebar_slots() do %>
        <.sidebar_slot name={slot.name} link={slot.link} />
      <% end %>
    </div>
    """
  end

  defp sidebar_slot(assigns) do
    ~H"""
    <div class="w-[100%] p-2 hover:bg-gray-100 rounded-md">
      <.link navigate={@link}>
        <%= @name %>
      </.link>
    </div>
    """
  end

  defp super_admin_sidebar_slots do
    [
      %{
        name: "Dashboard",
        link: "/dashboard"
      },
      %{
        name: "Events",
        link: "/events"
      },
      %{
        name: "Users",
        link: "/users"
      }
    ]
  end
end
