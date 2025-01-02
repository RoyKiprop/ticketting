defmodule Ticketting.Repo.Migrations.AddFieldPermissions do
  use Ecto.Migration

  def change do
    alter table(:permissions) do
      add :status, :string, default: "active"
    end
  end
end
