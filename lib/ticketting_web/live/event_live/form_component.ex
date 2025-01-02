defmodule TickettingWeb.EventLive.FormComponent do
  use TickettingWeb, :live_component

  alias Ticketting.Events

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Manage event records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="event-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:description]} type="textarea" rows="8" label="Description" />
        <.input field={@form[:location]} type="text" label="Location" />
        <div class="space-y-2">
          <label class="block text-sm font-medium">Image</label>
          <div class="flex items-center space-x-4 ">
            <.live_file_input upload={@uploads.image} class="cursor-pointer" />
          </div>

          <%= for entry <- @uploads.image.entries do %>
            <div class="flex flex-col space-y-2 ">
              <.live_img_preview entry={entry} class="h-32 w-32 object-cover rounded-lg" />
              <div class="space-y-1">
                <button
                  type="button"
                  class="text-red-500 text-sm"
                  phx-click="cancel-upload"
                  phx-value-ref={entry.ref}
                  phx-target={@myself}
                >
                  Cancel Upload
                </button>
              </div>
            </div>
            <%= for err <- upload_errors(@uploads.image, entry) do %>
              <div class="text-red-500 text-sm"><%= err %></div>
            <% end %>
          <% end %>
        </div>
        <.input field={@form[:start_time]} type="time" label="Start time" />
        <.input field={@form[:end_time]} type="time" label="End time" />
        <.input field={@form[:is_active]} type="checkbox" label="Is active" />
        <.input field={@form[:slug]} type="text" label="Slug" />
        <.input field={@form[:date]} type="datetime-local" label="Date" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Event</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{event: event} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> allow_upload(:image,
       accept: ~w(.jpg .jpeg .png .svg),
       max_entries: 1,
       max_file_size: 10_000_000
     )
     |> assign_new(:form, fn ->
       to_form(Events.change_event(event))
     end)}
  end

  @impl true
  def handle_event("validate", %{"event" => event_params}, socket) do
    changeset = Events.change_event(socket.assigns.event, event_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"event" => event_params}, socket) do
    IO.inspect(socket)

    event_params =
      event_params
      |> Map.put("user_id", socket.assigns.current_user.id)

    uploaded_files =
      consume_uploaded_entries(socket, :image, fn %{path: path}, _entry ->
        dest = Path.join(["priv", "static", "uploads", Path.basename(path)])
        File.cp!(path, dest)
        {:ok, "/uploads/#{Path.basename(path)}"}
      end)

    event_params =
      case uploaded_files do
        [image_path] -> Map.put(event_params, "image", image_path)
        [] -> event_params
      end

    save_event(socket, socket.assigns.action, event_params)
  end

  defp save_event(socket, :edit, event_params) do
    case Events.update_event(socket.assigns.event, event_params) do
      {:ok, event} ->
        notify_parent({:saved, event})

        {:noreply,
         socket
         |> put_flash(:info, "Event updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_event(socket, :new, event_params) do
    case Events.create_event(event_params) do
      {:ok, event} ->
        notify_parent({:saved, event})

        {:noreply,
         socket
         |> put_flash(:info, "Event created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
