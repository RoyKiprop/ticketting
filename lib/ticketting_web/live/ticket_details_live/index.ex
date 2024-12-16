defmodule TickettingWeb.TicketDetailsLive.Index do
  use TickettingWeb, :live_view
  alias Ticketting.Events
  alias Ticketting.Tickets

  def mount(%{"slug" => slug}, _session, socket) do
    event = Events.get_event_by_slug(slug)
    ticket_types = event.ticket_types
    random_events = Events.random_events(event.id)

    {:ok,
     socket
     |> assign(
       event: event,
       ticket_types: ticket_types,
       random_events: random_events,
       show_ticket_modal: false
     )}
  end

  def handle_event("view-event", %{"slug" => slug}, socket) do
    {:noreply,
     socket
     |> push_navigate(to: "/#{slug}/tickets")}
  end

  def handle_event("buy-ticket", %{"type" => ticket_type, "price" => ticket_price}, socket) do
    IO.inspect(ticket_type)

    {:noreply,
     socket
     |> assign(
       show_ticket_modal: true,
       ticket: %Tickets.Ticket{},
       ticket_type: ticket_type,
       ticket_price: ticket_price
     )}
  end

  def handle_event("close_modal", _params, socket) do
    {:noreply,
     socket
     |> assign(show_ticket_modal: false)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <.ticket_info event={@event} />
      <.price_options ticket_types={@ticket_types} />
      <.other_likes random_events={@random_events} />
      <%= if @show_ticket_modal do %>
        <.live_component
          module={TickettingWeb.TicketDetailsLive.FormComponent}
          id={:new}
          ticket={@ticket}
          event={@event.name}
          ticket_type={@ticket_type}
          price={@ticket_price}
        />
      <% end %>
    </div>
    """
  end
end
