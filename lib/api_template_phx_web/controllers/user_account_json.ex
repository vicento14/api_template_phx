defmodule ApiTemplatePhxWeb.UserAccountJSON do
  alias ApiTemplatePhx.UserAccounts.UserAccount

  @doc """
  Renders a list of user_accounts.
  """
  def index(%{user_accounts: user_accounts}) do
    %{data: for(user_account <- user_accounts, do: data(user_account))}
  end

  @doc """
  Renders a single user_account.
  """
  def show(%{user_account: user_account}) do
    %{data: data(user_account)}
  end

  defp data(%UserAccount{} = user_account) do
    %{
      id: user_account.id,
      id_number: user_account.id_number,
      full_name: user_account.full_name,
      username: user_account.username,
      password: user_account.password,
      section: user_account.section,
      role: user_account.role
    }
  end
end
