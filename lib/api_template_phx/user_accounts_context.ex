defmodule ApiTemplatePhx.UserAccountsContext do
  @moduledoc """
  The UserAccountsContext context.
  """

  import Ecto.Query, warn: false
  alias ApiTemplatePhx.Repo

  alias ApiTemplatePhx.UserAccounts.UserAccount

  @doc """
  Returns the list of user_accounts.

  ## Examples

      iex> list_user_accounts()
      [%UserAccount{}, ...]

  """

  def list_user_accounts do
    Repo.all(UserAccount)
  end

  # def list_user_accounts(filters \\ %{}) do
  #   IO.puts("Starting list_user_accounts with filters: #{inspect(filters)}")
  #   UserAccount
  #   |> apply_filters(filters)
  #   |> Repo.all()
  # end

  # defp apply_filters(query, %{}) do
  #   IO.puts("No filters provided. Returning unmodified query.")
  #   query
  # end

  # defp apply_filters(query, %{"id_number" => id_number}) when id_number not in [nil] do
  #   IO.puts("Applying filter for id_number: #{id_number}")
  #   query
  #   |> where([u], like(u.id_number, ^"#{id_number}%"))
  # end

  # defp apply_filters(query, %{"full_name" => full_name}) when full_name not in [nil] do
  #   IO.puts("Applying filter for full_name: #{full_name}")
  #   query
  #   |> where([u], like(u.full_name, ^"#{full_name}%"))
  # end

  # defp apply_filters(query, %{"role" => role}) when role not in [nil] do
  #   IO.puts("Applying filter for role: #{role}")
  #   query
  #   |> where([u], u.role == ^role)
  # end

  # defp apply_filters(query, filters) do
  #   IO.puts("Applying additional filters: #{inspect(filters)}")
  #   Enum.reduce(filters, query, fn
  #     {"id_number", id_number}, query when id_number not in [nil] ->
  #       IO.puts("Applying additional filter for id_number: #{id_number}")
  #       where(query, [u], like(u.id_number, ^"#{id_number}%"))

  #     {"full_name", full_name}, query when full_name not in [nil] ->
  #       IO.puts("Applying additional filter for full_name: #{full_name}")
  #       where(query, [u], like(u.full_name, ^"#{full_name}%"))

  #     {"role", role}, query when role not in [nil] ->
  #       IO.puts("Applying additional filter for role: #{role}")
  #       where(query, [u], u.role == ^role)

  #     _filter, query ->
  #       query
  #   end)
  # end

  @doc """
  Gets a single user_account.

  Raises `Ecto.NoResultsError` if the UserAccount does not exist.

  ## Examples

      iex> get_user_account!(123)
      %UserAccount{}

      iex> get_user_account!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_account!(id), do: Repo.get!(UserAccount, id)

  @doc """
  Creates a user_account.

  ## Examples

      iex> create_user_account(%{field: value})
      {:ok, %UserAccount{}}

      iex> create_user_account(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_account(attrs \\ %{}) do
    %UserAccount{}
    |> UserAccount.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_account.

  ## Examples

      iex> update_user_account(user_account, %{field: new_value})
      {:ok, %UserAccount{}}

      iex> update_user_account(user_account, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_account(%UserAccount{} = user_account, attrs) do
    user_account
    |> UserAccount.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_account.

  ## Examples

      iex> delete_user_account(user_account)
      {:ok, %UserAccount{}}

      iex> delete_user_account(user_account)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_account(%UserAccount{} = user_account) do
    Repo.delete(user_account)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_account changes.

  ## Examples

      iex> change_user_account(user_account)
      %Ecto.Changeset{data: %UserAccount{}}

  """
  def change_user_account(%UserAccount{} = user_account, attrs \\ %{}) do
    UserAccount.changeset(user_account, attrs)
  end
end
