defmodule ApiTemplatePhxWeb.UserAccountController do
  use ApiTemplatePhxWeb, :controller

  alias ApiTemplatePhx.UserAccountsContext
  alias ApiTemplatePhx.UserAccounts.UserAccount

  action_fallback ApiTemplatePhxWeb.FallbackController

  def index(conn, _params) do
    user_accounts = UserAccountsContext.list_user_accounts()
    render(conn, :index, user_accounts: user_accounts)
  end

  def create(conn, %{"user_account" => user_account_params}) do
    with {:ok, %UserAccount{} = user_account} <- UserAccountsContext.create_user_account(user_account_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/user_accounts/#{user_account}")
      |> render(:show, user_account: user_account)
    end
  end

  # def search(conn, params) do
  #   IO.inspect(params, label: "Incoming Search Parameters")

  #   filters = %{
  #     "id_number" => Map.get(params, "id_number"),
  #     "full_name" => Map.get(params, "full_name"),
  #     "role" => Map.get(params, "role")
  #   }

  #   IO.inspect(filters, label: "Processed Filters")

  #   user_accounts = UserAccountsContext.list_user_accounts(filters)
  #   # IO.inspect(user_accounts, label: "User Accounts Result")

  #   render(conn, :index, user_accounts: user_accounts)
  # end

  # def search(conn, _params) do
  #   # Handle the case where no parameters are provided
  #   user_accounts = UserAccountsContext.list_user_accounts()
  #   render(conn, :index, user_accounts: user_accounts)
  # end

  def show(conn, %{"id" => id}) do
    id = case Integer.parse(id) do
      {int_id, _} -> int_id
      :error -> raise Ecto.Query.CastError, message: "Invalid ID format"
    end

    user_account = UserAccountsContext.get_user_account!(id)
    render(conn, :show, user_account: user_account)
  end

  def update(conn, %{"id" => id, "user_account" => user_account_params}) do
    id = case Integer.parse(id) do
      {int_id, _} -> int_id
      :error -> raise Ecto.Query.CastError, message: "Invalid ID format"
    end

    user_account = UserAccountsContext.get_user_account!(id)

    with {:ok, %UserAccount{} = user_account} <- UserAccountsContext.update_user_account(user_account, user_account_params) do
      render(conn, :show, user_account: user_account)
    end
  end

  def delete(conn, %{"id" => id}) do
    id = case Integer.parse(id) do
      {int_id, _} -> int_id
      :error -> raise Ecto.Query.CastError, message: "Invalid ID format"
    end

    user_account = UserAccountsContext.get_user_account!(id)

    with {:ok, %UserAccount{}} <- UserAccountsContext.delete_user_account(user_account) do
      send_resp(conn, :no_content, "")
    end
  end

end
