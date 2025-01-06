defmodule TickettingWeb.AddRolePermissions do
  use TickettingWeb, :live_component

  alias Ticketting.Accounts.Permission
  alias Ticketting.Accounts

  @impl true
  def render(assigns) do
    ~H"""
    <div class="modal">
      <.header>
        <%= @title %>
      </.header>

      <.simple_form for={@form} id="permission-form" phx-target={@myself} phx-submit="save">
        <ul>
          <%= for permission <- @permissions do %>
            <input
              type="checkbox"
              value={permission.id}
              phx-target={@myself}
              checked={permission.id in @role_permissions}
              phx-click="toggle_permission"
              phx-value-id={permission.id}
            />
            <label><%= permission.slug %></label>
          <% end %>
        </ul>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Accounts.change_permission(%Permission{}))
     end)}
  end

  @impl true
  def handle_event("validate", %{"permission" => permission_params}, socket) do
    changeset = Accounts.change_permission(%Permission{}, permission_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("toggle_permission", %{"id" => id}, socket) do
    role_id = socket.assigns.role.id

    permission_id = String.to_integer(id)

    if permission_id in socket.assigns.role_permissions do
      Accounts.delete_role_permission(role_id, permission_id)
    else
      Accounts.create_role_permission(%{role_id: role_id, permission_id: permission_id})
    end

    updated_role_permissions =
      Accounts.get_role_permissions_by_role_id(role_id)

    {:noreply,
     socket
     |> assign(:role_permissions, updated_role_permissions)}
  end
end
