defmodule Ticketting.Tickets.Ticket do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tickets" do
    field :name, :string
    field :phone, :string
    field :email, :string
    field :total_price, :decimal
    field :quantity, :integer
    field :ticket_type_id, :id
    field :event_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(ticket, attrs) do
    ticket
    |> cast(attrs, [:name, :phone, :email, :total_price, :quantity])
    |> validate_required([:name, :phone, :email, :total_price, :quantity])
  end
end
