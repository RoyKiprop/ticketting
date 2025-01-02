defmodule Ticketting.Repo.Migrations.RemoveIdPermissions do
  use Ecto.Migration

  def change do
    alter table(:permissions) do
      remove :role_id
    end
  end
end
