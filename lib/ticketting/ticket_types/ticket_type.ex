defmodule Ticketting.TicketTypes.TicketType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ticket_types" do
    field :name, :string
    field :description, :string
    field :price, :decimal
    field :quantity_sold, :integer
    field :quantity_available, :integer
    field :activate_on, :utc_datetime
    field :deactivate_on, :utc_datetime
    field :user_id, :id
    field :event_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(ticket_type, attrs) do
    ticket_type
    |> cast(attrs, [
      :name,
      :description,
      :price,
      :quantity_sold,
      :quantity_available,
      :activate_on,
      :deactivate_on,
      :user_id,
      :event_id
    ])
    |> validate_required([
      :name,
      :description,
      :price,
      :quantity_sold,
      :quantity_available,
      :activate_on,
      :deactivate_on
    ])
  end
end
