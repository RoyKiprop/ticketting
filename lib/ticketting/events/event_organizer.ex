defmodule Ticketting.Events.EventOrganizer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "event_organizers" do

    field :user_id, :id
    field :event_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(event_organizer, attrs) do
    event_organizer
    |> cast(attrs, [])
    |> validate_required([])
  end
end
