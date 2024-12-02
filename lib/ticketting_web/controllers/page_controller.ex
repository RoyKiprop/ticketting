defmodule TickettingWeb.PageController do
  use TickettingWeb, :controller

  def home(conn, _params) do
    redirect(conn, to: "/")
  end
end
