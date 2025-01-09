defmodule Ticketting.Repo.Migrations.UpdateRolePermissionsOnDelete do
  use Ecto.Migration

  def change do
    drop constraint(:role_permissions, "role_permissions_permission_id_fkey")
    drop constraint(:role_permissions, "role_permissions_role_id_fkey")

    alter table(:role_permissions) do
      modify :permission_id, references(:permissions, on_delete: :delete_all)
      modify :role_id, references(:roles, on_delete: :delete_all)
    end
  end
end
