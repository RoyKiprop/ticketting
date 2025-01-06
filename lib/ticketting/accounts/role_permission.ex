defmodule Ticketting.Accounts.RolePermission do
  use Ecto.Schema
  import Ecto.Changeset

  schema "role_permissions" do
    belongs_to :role, Ticketting.Accounts.Role
    belongs_to :permission, Ticketting.Accounts.Permission

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(role_permission, attrs) do
    role_permission
    |> cast(attrs, [:role_id, :permission_id])
    |> validate_required([])
  end
end
