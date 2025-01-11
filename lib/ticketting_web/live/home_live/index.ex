defmodule TickettingWeb.HomeLive.Index do
  use TickettingWeb, :live_view

  alias Ticketting.Events

  def mount(_params, _session, socket) do
    upcoming_events = Events.upcoming_events()

    {:ok,
     socket
     |> assign(upcoming_events: upcoming_events, open_faq: nil)}
  end

  def handle_event("view-event", %{"slug" => slug}, socket) do
    {:noreply,
     socket
     |> push_navigate(to: "/#{slug}/tickets")}
  end

  def handle_event("toggle_faq", %{"question" => question}, socket) do
    new_open_faq = if socket.assigns.open_faq == question, do: nil, else: question

    {:noreply,
     socket
     |> assign(open_faq: new_open_faq)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <.hero current_user={@current_user} permissions={@user_permissions} />
      <.events upcoming_events={@upcoming_events} />
      <.purchase_guide />
      <.faqs open_faq={@open_faq} />
      <.join_brands />
    </div>
    """
  end
end
