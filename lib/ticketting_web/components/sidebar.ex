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

  def admin_sidebar(assigns) do
    ~H"""
    <div class="w-[18%] p-5 h-[100vh] bg-white shadow-sm shadow-gray-400">
      <%= for slot <- admin_sidebar_slots() do %>
        <.admin_slot name={slot.name} link={slot.link} />
      <% end %>
    </div>
    """
  end

  defp admin_slot(assigns) do
    ~H"""
    <div class="w-[100%] p-2 hover:bg-gray-100 rounded-md">
      <.link navigate={@link}>
        <%= @name %>
      </.link>
    </div>
    """
  end

  def organizer_sidebar(assigns) do
    ~H"""
    <div class="w-[18%] p-5 h-[100vh] bg-white shadow-sm shadow-gray-400">
      <%= for slot <- organizer_sidebar_slots() do %>
        <.organizer_slot name={slot.name} link={slot.link} />
      <% end %>
    </div>
    """
  end

  defp organizer_slot(assigns) do
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
      },
      %{
        name: "Roles",
        link: "/roles"
      },
      %{
        name: "Permissions",
        link: "/permissions"
      }
    ]
  end

  defp admin_sidebar_slots do
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
        name: "Organizers",
        link: "/users"
      },
      %{
        name: "Ticket Types",
        link: "/ticket_types"
      },
      %{
        name: "Permissions",
        link: "/permissions"
      }
    ]
  end

  defp organizer_sidebar_slots do
    [
      %{
        name: "Events",
        link: "/events"
      },
      %{
        name: "Ticket Types",
        link: "/ticket_types"
      }
    ]
  end
end
