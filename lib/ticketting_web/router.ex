defmodule TickettingWeb.Router do
  use TickettingWeb, :router

  import TickettingWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {TickettingWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
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
    pipe_through [:browser, :require_authenticated_user]

    live_session :require_authenticated_user,
      on_mount: [{TickettingWeb.UserAuth, :ensure_authenticated}] do
      live "/users/settings", UserSettingsLive, :edit
      live "/users/settings/confirm_email/:token", UserSettingsLive, :confirm_email

      live "/permissions", PermissionLive.Index, :index
      live "/permissions/new", PermissionLive.Index, :new
      live "/permissions/:id/edit", PermissionLive.Index, :edit

      live "/permissions/:id", PermissionLive.Show, :show
      live "/permissions/:id/show/edit", PermissionLive.Show, :edit
    end

    live_session :super_admin_routes,
      on_mount: [{TickettingWeb.UserAuth, :ensure_super_admin}] do
      live "/roles", RoleLive.Index, :index
      live "/roles/new", RoleLive.Index, :new
      live "/roles/:id/edit", RoleLive.Index, :edit

      live "/roles/:id", RoleLive.Show, :show
      live "/roles/:id/show/edit", RoleLive.Show, :edit

      live "/super_admin/users", UserLive.Index, :index
      live "/super_admin/users/new", UserLive.Index, :new
      live "/super_admin/users/:id/edit", UserLive.Index, :edit
    end

    live_session :admin_routes,
      on_mount: [{TickettingWeb.UserAuth, :ensure_admin}] do
      live "/events", EventLive.Index, :index
      live "/events/new", EventLive.Index, :new
      live "/events/:id/edit", EventLive.Index, :edit

      live "/events/:id", EventLive.Show, :show
      live "/events/:id/show/edit", EventLive.Show, :edit

      live "/tickets", TicketLive.Index, :index
      live "/tickets/new", TicketLive.Index, :new
      live "/tickets/:id/edit", TicketLive.Index, :edit

      live "/tickets/:id", TicketLive.Show, :show
      live "/tickets/:id/show/edit", TicketLive.Show, :edit

      live "/ticket_types", TicketTypeLive.Index, :index
      live "/ticket_types/new", TicketTypeLive.Index, :new
      live "/ticket_types/:id/edit", TicketTypeLive.Index, :edit

      live "/ticket_types/:id", TicketTypeLive.Show, :show
      live "/ticket_types/:id/show/edit", TicketTypeLive.Show, :edit

      live "/organizers", AdminUserLive.Index, :index
      live "/organizers/new", AdminUserLive.Index, :new
      live "/oranizers/:id/edit", AdminUserLive.Index, :edit
    end

    live_session :event_organizer_routes,
      on_mount: [{TickettingWeb.UserAuth, :event_organizer}] do
      live "/events", EventLive.Index, :index
      live "/events/new", EventLive.Index, :new
      live "/events/:id/edit", EventLive.Index, :edit

      live "/events/:id", EventLive.Show, :show
      live "/events/:id/show/edit", EventLive.Show, :edit

      live "/ticket_types", TicketTypeLive.Index, :index
      live "/ticket_types/new", TicketTypeLive.Index, :new
      live "/ticket_types/:id/edit", TicketTypeLive.Index, :edit

      live "/ticket_types/:id", TicketTypeLive.Show, :show
      live "/ticket_types/:id/show/edit", TicketTypeLive.Show, :edit
    end
  end

  scope "/", TickettingWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete

    live_session :current_user,
      on_mount: [{TickettingWeb.UserAuth, :mount_current_user}] do
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
