defmodule TickettingWeb.Router do
  use TickettingWeb, :router

  import TickettingWeb.UserAuth
  alias TickettingWeb.Plugs.Permission

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {TickettingWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
    plug :set_user_permissions
  end

  pipeline :authorized do
    plug Permission
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/", TickettingWeb do
  #   pipe_through :browser

  #   get "/", PageController, :home
  # end

  # Other scopes may use custom stacks.
  # scope "/api", TickettingWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:ticketting, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: TickettingWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/", TickettingWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    live_session :redirect_if_user_is_authenticated,
      on_mount: [{TickettingWeb.UserAuth, :redirect_if_user_is_authenticated}] do
      live "/users/register", UserRegistrationLive, :new
      live "/users/log_in", UserLoginLive, :new
      live "/users/reset_password", UserForgotPasswordLive, :new
      live "/users/reset_password/:token", UserResetPasswordLive, :edit
    end

    post "/users/log_in", UserSessionController, :create
  end

  scope "/", TickettingWeb do
    pipe_through [:browser, :authorized, :require_authenticated_user]

    live_session :protected,
      on_mount: [
        {TickettingWeb.UserAuth, :ensure_authenticated},
        {TickettingWeb.UserAuth, :set_user_permissions}
      ] do
      live "/roles", RoleLive.Index, :index
      live "/roles/new", RoleLive.Index, :new
      live "/roles/:id/edit", RoleLive.Index, :edit
      live "/roles/:id", RoleLive.Show, :show
      live "/roles/:id/add_permission", RoleLive.Show, :add_permission

      live "/permissions", PermissionLive.Index, :index
      live "/permissions/new", PermissionLive.Index, :new
      live "/permissions/:id/edit", PermissionLive.Index, :edit
      live "/permissions/:id", PermissionLive.Show, :show
      live "/permissions/:id/show/edit", PermissionLive.Show, :edit

      live "/events", EventLive.Index, :index
      live "/events/new", EventLive.Index, :new
      live "/events/:id/edit", EventLive.Index, :edit
      live "/events/:id", EventLive.Show, :show
      live "/events/:id/show/edit", EventLive.Show, :edit

      live "/dashboard", DashboardLive.Index, :index

      live "/ticket_types", TicketTypeLive.Index, :index
      live "/ticket_types/new", TicketTypeLive.Index, :new
      live "/ticket_types/:id/edit", TicketTypeLive.Index, :edit
      live "/ticket_types/:id", TicketTypeLive.Show, :show
      live "/ticket_types/:id/show/edit", TicketTypeLive.Show, :edit

      live "/users", UserLive.Index, :index
      live "/users/new", UserLive.Index, :new
      live "/users/:id/edit", UserLive.Index, :edit

      live "/users/settings", UserSettingsLive, :edit
      live "/users/settings/confirm_email/:token", UserSettingsLive, :confirm_email
    end
  end

  scope "/", TickettingWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete
    get "/users/log_out", UserSessionController, :delete

    live_session :current_user,
      on_mount: [
        {TickettingWeb.UserAuth, :mount_current_user},
        {TickettingWeb.UserAuth, :set_user_permissions}
      ] do
      live "/users/confirm/:token", UserConfirmationLive, :edit
      live "/users/confirm", UserConfirmationInstructionsLive, :new

      live "/", HomeLive.Index, :index
      live "/all-events", EventsPageLive.Index, :index
      live "/about", AboutLive.Index, :index

      live "/:slug/tickets", TicketDetailsLive.Index, :index
      live "/:slug/tickets/buy", TicketDetailsLive.Buy
    end
  end
end
