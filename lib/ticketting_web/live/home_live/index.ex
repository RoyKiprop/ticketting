defmodule TickettingWeb.HomeLive.Index do
  use TickettingWeb, :live_view

  alias Ticketting.Events

  def mount(_params, _session, socket) do
    upcoming_events = Events.upcoming_events()

    {:ok,
     socket
     |> assign(upcoming_events: upcoming_events)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <.hero />
      <.events upcoming_events={@upcoming_events} />
    </div>
    """
  end
end
