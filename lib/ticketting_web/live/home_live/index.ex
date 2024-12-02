defmodule TickettingWeb.HomeLive.Index do
  use TickettingWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div>
      <.hero />
      <.events />
    </div>
    """
  end
end
