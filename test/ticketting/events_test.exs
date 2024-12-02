defmodule Ticketting.EventsTest do
  use Ticketting.DataCase

  alias Ticketting.Events

  describe "events" do
    alias Ticketting.Events.Event

    import Ticketting.EventsFixtures

    @invalid_attrs %{name: nil, date: nil, description: nil, location: nil, image: nil, start_time: nil, end_time: nil, is_active: nil, slug: nil}

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Events.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Events.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      valid_attrs = %{name: "some name", date: ~N[2024-12-01 12:48:00], description: "some description", location: "some location", image: "some image", start_time: ~T[14:00:00], end_time: ~T[14:00:00], is_active: true, slug: "some slug"}

      assert {:ok, %Event{} = event} = Events.create_event(valid_attrs)
      assert event.name == "some name"
      assert event.date == ~N[2024-12-01 12:48:00]
      assert event.description == "some description"
      assert event.location == "some location"
      assert event.image == "some image"
      assert event.start_time == ~T[14:00:00]
      assert event.end_time == ~T[14:00:00]
      assert event.is_active == true
      assert event.slug == "some slug"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Events.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      update_attrs = %{name: "some updated name", date: ~N[2024-12-02 12:48:00], description: "some updated description", location: "some updated location", image: "some updated image", start_time: ~T[15:01:01], end_time: ~T[15:01:01], is_active: false, slug: "some updated slug"}

      assert {:ok, %Event{} = event} = Events.update_event(event, update_attrs)
      assert event.name == "some updated name"
      assert event.date == ~N[2024-12-02 12:48:00]
      assert event.description == "some updated description"
      assert event.location == "some updated location"
      assert event.image == "some updated image"
      assert event.start_time == ~T[15:01:01]
      assert event.end_time == ~T[15:01:01]
      assert event.is_active == false
      assert event.slug == "some updated slug"
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Events.update_event(event, @invalid_attrs)
      assert event == Events.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Events.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Events.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Events.change_event(event)
    end
  end
end
