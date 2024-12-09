defmodule TickettingWeb.AdminUserLive.Index do
  use TickettingWeb, :admin_live_view

  alias Ticketting.Accounts
  alias Ticketting.Accounts.User

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(page_title: "Listing Users")
     |> stream(:users, Accounts.list_users())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit user")
    |> assign(:user, Accounts.get_user!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New user")
    |> assign(:user, %User{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Users")
    |> assign(:role, nil)
  end

  @impl true

  def render(assigns) do
    ~H"""
    <div>
      <.header>
        Listing Users
        <:actions>
          <.link patch={~p"/organisers/new"}>
            <.button>Add User</.button>
          </.link>
        </:actions>
      </.header>

      <.table id="users" rows={@streams.users}>
        <:col :let={{_id, user}} label="User"><%= user.email %></:col>
        <:col :let={{_id, user}} label="Active"><%= user.active %></:col>
        <:col :let={{_id, user}} label="Super Admin"><%= user.super_admin %></:col>
        <:action :let={{_id, user}}>
          <.link patch={~p"/users/#{user}/edit"}>Edit</.link>
        </:action>
      </.table>

      <.modal
        :if={@live_action in [:new, :edit]}
        id="user-modal"
        show
        on_cancel={JS.patch(~p"/organisers")}
      >
        <.live_component
          module={TickettingWeb.AdminUserLive.FormComponent}
          id={@user.id || :new}
          title={@page_title}
          action={@live_action}
          user={@user}
          patch={~p"/users"}
        />
      </.modal>
    </div>
    """
  end
end
