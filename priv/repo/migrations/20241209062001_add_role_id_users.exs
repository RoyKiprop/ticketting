defmodule Ticketting.Repo.Migrations.AddRoleIdUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :role
      add :role_id, references(:roles, on_delete: :nothing)
    end
  end
end
