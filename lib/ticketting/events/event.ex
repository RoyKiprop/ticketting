defmodule Ticketting.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :name, :string
    field :date, :naive_datetime
    field :description, :string
    field :location, :string
    field :image, :string
    field :start_time, :time
    field :end_time, :time
    field :is_active, :boolean, default: false
    field :slug, :string

    belongs_to :user, Ticketting.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [
      :name,
      :description,
      :location,
      :image,
      :start_time,
      :end_time,
      :is_active,
      :slug,
      :date,
      :user_id
    ])
    |> validate_required([
      :name,
      :description,
      :location,
      :image,
      :start_time,
      :end_time,
      :is_active,
      :date
    ])
  end
end
