defmodule Ticketting.Repo.Migrations.AddUserIdToEvents do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :user_id, references(:users, on_delete: :nothing)
    end

    create index(:events, [:user_id])
    create index(:events, [:slug])
  end
end
