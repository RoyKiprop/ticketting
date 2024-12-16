defmodule Ticketting.Repo.Migrations.AddFeatured do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :featured, :boolean, default: false
    end
  end
end
