defmodule TickettingWeb.TicketTypeLive.FormComponent do
  use TickettingWeb, :live_component

  alias Ticketting.TicketTypes
  alias Ticketting.Events

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage ticket_type records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="ticket_type-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:description]} type="text" label="Description" />
        <.input
          field={@form[:event_id]}
          type="select"
          label="Event"
          options={Enum.map(@events, &{&1.name, &1.id})}
        />
        <.input field={@form[:price]} type="number" label="Price" step="any" />
        <.input field={@form[:quantity_sold]} type="number" label="Quantity sold" />
        <.input field={@form[:quantity_available]} type="number" label="Quantity available" />
        <.input field={@form[:activate_on]} type="datetime-local" label="Activate on" />
        <.input field={@form[:deactivate_on]} type="datetime-local" label="Deactivate on" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Ticket type</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{ticket_type: ticket_type} = assigns, socket) do
    user_id = assigns.current_user.id
    events = Events.list_user_events(user_id)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:events, events)
     |> assign_new(:form, fn ->
       to_form(TicketTypes.change_ticket_type(ticket_type))
     end)}
  end

  @impl true
  def handle_event("validate", %{"ticket_type" => ticket_type_params}, socket) do
    changeset = TicketTypes.change_ticket_type(socket.assigns.ticket_type, ticket_type_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"ticket_type" => ticket_type_params}, socket) do
    ticket_type_params =
      ticket_type_params
      |> Map.put("user_id", socket.assigns.current_user.id)

    save_ticket_type(socket, socket.assigns.action, ticket_type_params)
  end

  defp save_ticket_type(socket, :edit, ticket_type_params) do
    case TicketTypes.update_ticket_type(socket.assigns.ticket_type, ticket_type_params) do
      {:ok, ticket_type} ->
        notify_parent({:saved, ticket_type})

        {:noreply,
         socket
         |> put_flash(:info, "Ticket type updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_ticket_type(socket, :new, ticket_type_params) do
    case TicketTypes.create_ticket_type(ticket_type_params) do
      {:ok, ticket_type} ->
        notify_parent({:saved, ticket_type})

        {:noreply,
         socket
         |> put_flash(:info, "Ticket type created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
