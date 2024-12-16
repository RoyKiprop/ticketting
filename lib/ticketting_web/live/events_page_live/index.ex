defmodule TickettingWeb.EventsPageLive.Index do
  use TickettingWeb, :live_view
  alias Ticketting.Events

  def mount(_params, _session, socket) do
    active_events = Events.active_events()

    {:ok,
     socket
     |> assign(active_events: active_events)}
  end

  def render(assigns) do
    ~H"""
    <.all_events active_events={@active_events} />
    <.steps />
    <.join_brands />
    """
  end
end
