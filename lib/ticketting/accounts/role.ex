defmodule Ticketting.Accounts.Role do
  use Ecto.Schema
  import Ecto.Changeset

  schema "roles" do
    field :name, :string
    field :slug, :string
    field :status, :string, default: "active"
    many_to_many :roles, Ticketting.Accounts.Role, join_through: "role_permissions"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(role, attrs) do
    role
    |> cast(attrs, [:name, :slug, :status])
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
