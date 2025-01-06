defmodule TickettingWeb.RoleLive.Show do
  use TickettingWeb, :admin_live_view

  alias Ticketting.Accounts

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    role = Accounts.get_role!(String.to_integer(id))
    permissions = Accounts.list_permissions()
    current_role_permissions = Accounts.get_all_role_permissions(role.id)
    role_permissions = Accounts.get_role_permissions_by_role_id(role.id)

    {:ok,
     socket
     |> assign(
       permissions: permissions,
       current_role_permissions: current_role_permissions,
       role_permissions: role_permissions
     )}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:role, Accounts.get_role!(String.to_integer(id)))
     |> assign(:permissions, Accounts.list_permissions())
     |> assign(
       :role_permissions,
       Accounts.get_role_permissions_by_role_id(String.to_integer(id))
     )
     |> assign(
       :current_role_permissions,
       Accounts.get_all_role_permissions(String.to_integer(id))
     )}
  end

  @impl true
  def handle_event("remove_permission", %{"permission_id" => permission_id}, socket) do
    socket =
      case Accounts.delete_role_permission(
             socket.assigns.role.id,
             String.to_integer(permission_id)
           ) do
        {:ok, _} ->
          socket
          |> put_flash(:info, "Permission removed successfully.")

        {:error, _} ->
          socket |> put_flash(:error, "Failed to remove permission.")
      end

    {:noreply, socket}
  end

  defp page_title(:show), do: "Show Role"
  defp page_title(:edit), do: "Edit Role"
  defp page_title(:add_permission), do: "Add Role Permission"
end
