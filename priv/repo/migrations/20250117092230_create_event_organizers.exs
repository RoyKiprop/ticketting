defmodule Ticketting.Repo.Migrations.CreateEventOrganizers do
  use Ecto.Migration

  def change do
    create table(:event_organizers) do
      add :user_id, references(:users, on_delete: :nothing)
      add :event_id, references(:events, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:event_organizers, [:user_id, :event_id])
  end
end
