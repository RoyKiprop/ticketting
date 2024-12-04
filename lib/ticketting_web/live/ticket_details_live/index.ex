defmodule TickettingWeb.TicketDetailsLive.Index do
  use TickettingWeb, :live_view
  alias Ticketting.Events

  def mount(%{"slug" => slug}, _session, socket) do
    event = Events.get_event_by_slug(slug)

    {:ok,
     socket
     |> assign(event: event)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <.ticket_info event={@event} />
      <.price_options />
      <.other_likes />
    </div>
    """
  end
end
