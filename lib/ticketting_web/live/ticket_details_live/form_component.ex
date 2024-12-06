defmodule TickettingWeb.TicketDetailsLive.FormComponent do
  use TickettingWeb, :live_component

  alias Ticketting.Tickets

  @impl true
  def update(%{ticket: ticket} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Tickets.change_ticket(ticket))
     end)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div
      phx-click="close_modal"
      id="modal-backdrop"
      class="fixed inset-0 bg-black bg-opacity-80 flex justify-center items-center z-50 "
    >
      <div class="bg-white px-6 pt-4 pb-6 w-full max-w-2xl rounded-lg shadow-lg relative">
        <div class="flex justify-end mb-2">
          <button type="button" phx-click="close_modal" class=" text-gray-500 hover:text-gray-800">
            <i class="fas fa-times text-2xl"></i>
          </button>
        </div>

        <h2 class="text-xl font-light text-center mb-4">
          Get an <span class="font-bold"> <%= @ticket_type %> </span>Ticket For
          <span class="font-bold text-blue-500"><%= @event %></span>
        </h2>

        <.simple_form for={@form} phx-submit="process-payment">
          <.input field={@form[:name]} type="text" label="Name" />
          <.input field={@form[:phone]} type="text" label="Phone" />
          <.input field={@form[:email]} type="text" label="Email" />
          <.input field={@form[:quantity]} type="number" label="Number" />
          <p>Total Price: 1000 KES</p>
          <div class="flex justify-center">
            <.button class="px-8 py-2" phx-disable-with="Saving...">Proceed To Pay</.button>
          </div>
        </.simple_form>
      </div>
    </div>
    """
  end
end
