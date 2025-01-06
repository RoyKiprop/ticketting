defmodule Ticketting.Accounts.Permission do
  use Ecto.Schema
  import Ecto.Changeset

  schema "permissions" do
    field :name, :string
    field :role_id, :id
    field :status, :string, default: "active"
    field :slug, :string
    many_to_many :permissions, Ticketting.Accounts.Permission, join_through: "role_permissions"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(permission, attrs) do
    permission
    |> cast(attrs, [:name, :role_id, :slug, :status])
    |> validate_required([:name])
    |> generate_slug()
  end

  defp generate_slug(changeset) do
    case get_change(changeset, :name) do
      nil ->
        changeset

      name ->
        put_change(changeset, :slug, Slug.slugify(name))
    end
  end
end
