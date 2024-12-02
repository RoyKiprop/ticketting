defmodule Ticketting.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :description, :text
      add :location, :string
      add :image, :string
      add :start_time, :time
      add :end_time, :time
      add :is_active, :boolean, default: false, null: false
      add :slug, :string
      add :date, :naive_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
