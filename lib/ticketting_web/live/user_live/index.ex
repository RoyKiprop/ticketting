defmodule TickettingWeb.UserLive.Index do
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
  def handle_params(params, _uri, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(page_title: "Edit User")
    |> assign(:user, Accounts.get_user!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(page_title: "New User")
    |> assign(:user, %User{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(page_title: "Listing Users")
    |> assign(:user, nil)
  end

  @impl true
  def handle_info({TickettingWeb.UserLive.FormComponent, {:saved, user}}, socket) do
    {:noreply, stream_insert(socket, :users, user)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <div class="overflow-x-auto">
        <div class="flex my-3 justify-end">
          <.link
            patch={~p"/users/new"}
            class="bg-[#7fc8ff] hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
          >
            New user
          </.link>
        </div>
        <table class="min-w-full bg-white border border-gray-200 shadow rounded-lg">
          <thead class="bg-gray-200">
            <tr>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                Name
              </th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                Email
              </th>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">
                Actions
              </th>
            </tr>
          </thead>
          <tbody phx-update="stream" id="users" class="divide-y divide-gray-200">
            <tr :for={{id, user} <- @streams.users} id={id}>
              <td class="px-6 py-4 text-sm text-gray-900"><%= user.name %></td>
              <td class="px-6 py-4 text-sm text-gray-900"><%= user.email %></td>
              <td class="px-6 py-4 text-sm text-gray-900">
                <.link
                  patch={~p"/users/#{user}/edit"}
                  class="text-green-500 hover:text-green-700 font-bold "
                >
                  Edit
                </.link>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <.modal :if={@live_action in [:new, :edit]} id="user-modal" show on_cancel={JS.patch(~p"/users")}>
      <.live_component
        module={TickettingWeb.UserLive.FormComponent}
        id={@user.id || :new}
        title={@page_title}
        current_user={@current_user}
        action={@live_action}
        user={@user}
        patch={~p"/users"}
      />
    </.modal>
    """
  end
end
