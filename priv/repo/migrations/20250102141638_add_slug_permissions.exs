defmodule Ticketting.Repo.Migrations.AddSlugPermissions do
  use Ecto.Migration

  def change do
    alter table(:permissions) do
      add :slug, :string
    end

  end
end
