defmodule ApiTemplatePhx.UserAccounts.UserAccount do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_accounts" do
    field :id_number, :string
    field :full_name, :string
    field :username, :string
    field :password, :string
    field :section, :string
    field :role, :string
  end

  @doc false
  def changeset(user_account, attrs) do
    user_account
    |> cast(attrs, [:id_number, :full_name, :username, :password, :section, :role])
    |> validate_required([:id_number, :full_name, :username, :password, :section, :role])
  end
end
