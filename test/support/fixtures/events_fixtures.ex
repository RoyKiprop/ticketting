defmodule Ticketting.EventsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Ticketting.Events` context.
  """

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        date: ~N[2024-12-01 12:48:00],
        description: "some description",
        end_time: ~T[14:00:00],
        image: "some image",
        is_active: true,
        location: "some location",
        name: "some name",
        slug: "some slug",
        start_time: ~T[14:00:00]
      })
      |> Ticketting.Events.create_event()

    event
  end

  @doc """
  Generate a event_organizer.
  """
  def event_organizer_fixture(attrs \\ %{}) do
    {:ok, event_organizer} =
      attrs
      |> Enum.into(%{

      })
      |> Ticketting.Events.create_event_organizer()

    event_organizer
  end
end
