defmodule TickettingWeb.Plugs.Permission do
  import Plug.Conn
  import Phoenix.Controller
  use TickettingWeb, :verified_routes

  def init(opts), do: opts

  def call(conn, _opts) do
    IO.inspect(conn, label: "Connection")
    permissions = conn.assigns[:user_permissions] || []
    path = current_path(conn)

    if has_permission_for_route?(path, permissions) do
      conn
    else
      conn
      |> put_flash(:error, "You are not authorized to access this page.")
      |> redirect(to: ~p"/")
      |> halt()
    end
  end

  defp has_permission_for_route?(path, permissions) do
    cond do
      String.match?(path, ~r{^/events}) && "view-events" in permissions -> true
      String.match?(path, ~r{^/users}) && "view-users" in permissions -> true
      String.match?(path, ~r{^/tickets}) && "view-tickets" in permissions -> true
      String.match?(path, ~r{^/ticket_types}) && "view-ticket-types" in permissions -> true
      String.match?(path, ~r{^/roles}) && "view-roles" in permissions -> true
      String.match?(path, ~r{^/permissions}) && "view-permissions" in permissions -> true
      String.match?(path, ~r{^/dashboard}) && "view-dashboard" in permissions -> true
      path in ["/", "/about", "/all-events"] -> true
      true -> false
    end
  end
end
