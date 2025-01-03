defmodule TickettingWeb.UserLoginLive do
  use TickettingWeb, :login_live_view

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-xl">
      <.header class="text-center space-y-2">
        <h2 class="text-2xl md:text-5xl font-extrabold text-black drop-shadow-sm mb-4">
          Welcome To Roy Events
        </h2>
        <p class="text-gray-600">Log in to account</p>
      </.header>

      <.simple_form for={@form} id="login_form" action={~p"/users/log_in"} phx-update="ignore">
        <.input field={@form[:email]} type="email" label="Email" required />
        <.input field={@form[:password]} type="password" label="Password" required />

        <:actions>
          <.input field={@form[:remember_me]} type="checkbox" label="Keep me logged in" />
          <.link href={~p"/users/reset_password"} class="text-sm font-semibold">
            Forgot your password?
          </.link>
        </:actions>
        <:actions>
          <.button phx-disable-with="Logging in..." class="w-full">
            Log in <span aria-hidden="true">→</span>
          </.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    email = Phoenix.Flash.get(socket.assigns.flash, :email)
    form = to_form(%{"email" => email}, as: "user")
    {:ok, assign(socket, form: form), temporary_assigns: [form: form]}
  end
end
