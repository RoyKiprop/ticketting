defmodule Ticketting.Repo.Migrations.CreateTickets do
  use Ecto.Migration

  def change do
    create table(:tickets) do
      add :name, :string
      add :phone, :string
      add :email, :string
      add :total_price, :decimal
      add :quantity, :integer
      add :ticket_type_id, references(:ticket_types, on_delete: :nothing)
      add :event_id, references(:events, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:tickets, [:ticket_type_id])
    create index(:tickets, [:event_id])
  end
end
