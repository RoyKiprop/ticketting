defmodule TickettingWeb.AboutLive.Index do
  use TickettingWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <.aboutHero />
    <.sectionOne />
    <.join_brands />
    <.testimonials />
    """
  end
end
