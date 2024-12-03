defmodule Ticketting.Repo.Migrations.CreateTicketTypes do
  use Ecto.Migration

  def change do
    create table(:ticket_types) do
      add :name, :string
      add :description, :text
      add :price, :decimal
      add :quantity_sold, :integer
      add :quantity_available, :integer
      add :activate_on, :utc_datetime
      add :deactivate_on, :utc_datetime
      add :user_id, references(:users, on_delete: :nothing)
      add :event_id, references(:events, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:ticket_types, [:user_id])
    create index(:ticket_types, [:event_id])
  end
end
