defmodule Ticketting.Repo.Migrations.AddFieldsRoles do
  use Ecto.Migration

  def change do
    alter table(:roles) do
      add :status, :string, default: "active"
      add :slug, :string
    end


  end
end
