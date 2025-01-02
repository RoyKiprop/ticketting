defmodule Ticketting.Repo.Migrations.AddRole do
  use Ecto.Migration

  def change do
    alter table(:permissions) do
      add :role_id, references(:roles, on_delete: :nothing)
    end

    create index(:permissions, [:role_id])
  end
end
