defmodule TickettingWeb.UserLive.Index do
  use TickettingWeb, :super_admin_live_view

  alias Ticketting.Accounts
  alias Ticketting.Accounts.User

  @impl true
  def mount(_params, session, socket) do
    user_role = get_user_role(session)

    {:ok,
     socket
     |> assign(page_title: "Listing Users", user_role: user_role)
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
          <.link patch={~p"/users/new"}>
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
        on_cancel={JS.patch(~p"/users")}
      >
        <.live_component
          module={TickettingWeb.UserLive.FormComponent}
          id={@user.id || :new}
          title={@page_title}
          action={@live_action}
          user={@user}
          user_role={@user_role}
          patch={~p"/users"}
        />
      </.modal>
    </div>
    """
  end

  defp get_user_role(session) do
    case Accounts.get_user_by_session_token(session["user_token"]) do
      %{super_admin: true} -> :super_admin
      %{role: "admin"} -> :event_organizer
      _ -> :restricted
    end
  end
end
