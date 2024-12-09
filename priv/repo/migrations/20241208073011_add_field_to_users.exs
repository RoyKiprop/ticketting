defmodule Ticketting.Repo.Migrations.AddFieldToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :role, :string, default: "admin"
      add :super_admin, :boolean, default: false
      add :active, :boolean, default: true
    end
  end
end
