defmodule TickettingWeb.UserLive.FormComponent do
  use TickettingWeb, :live_component

  alias Ticketting.Accounts

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
      </.header>

      <.simple_form
        for={@form}
        id="user-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input type="text" label="Name" field={@form[:name]} />
        <.input type="text" label="Email" field={@form[:email]} />
        <.input type="select" label="Role" field={@form[:role_id]} options={@role_options} />
        <.input type="checkbox" label="Active" field={@form[:active]} />

        <:actions>
          <.button phx-disable-with="Saving...">Save User</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{user: user} = assigns, socket) do
    roles = Accounts.list_roles()
    role_options = Enum.map(roles, &{&1.slug, &1.id})

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:role_options, role_options)
     |> assign_new(:form, fn -> to_form(Accounts.change_user(user)) end)}
  end

  @impl true
  def handle_event("validate", %{"user" => user_params}, socket) do
    changeset = Accounts.change_user(socket.assigns.user, user_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  @impl true
  def handle_event("save", %{"user" => user_params}, socket) do
    save_user(socket, socket.assigns.action, user_params)
  end

  defp save_user(socket, :edit, params) do
    case Accounts.update_user(socket.assigns.user, params) do
      {:ok, user} ->
        notify_parent({:saved, user})

        {:noreply,
         socket
         |> put_flash(:info, "user updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:norepl, assign(socket, to_form(changeset))}
    end
  end

  defp save_user(socket, :new, user_params) do
    user_params =
      user_params
      |> Map.put("hashed_password", Bcrypt.hash_pwd_salt("123"))

    case Accounts.create_user(user_params) do
      {:ok, user} ->
        notify_parent({:saved, user})

        {:noreply,
         socket
         |> put_flash(:info, "user created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
