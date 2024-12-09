defmodule TickettingWeb.PermissionLive.Show do
  use TickettingWeb, :super_admin_live_view

  alias Ticketting.Accounts

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:permission, Accounts.get_permission!(id))}
  end

  defp page_title(:show), do: "Show Permission"
  defp page_title(:edit), do: "Edit Permission"
end
