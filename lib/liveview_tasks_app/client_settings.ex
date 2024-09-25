defmodule LiveviewTasksApp.ClientSettings do
  @moduledoc """
  The ClientSettings context.
  """

  import Ecto.Query, warn: false
  alias LiveviewTasksApp.Repo

  alias LiveviewTasksApp.ClientSettings.ClientSetting

  @doc """
  Returns the list of client_settings.

  ## Examples

      iex> list_client_settings()
      [%ClientSetting{}, ...]

  """
  def list_client_settings do
    Repo.all(ClientSetting)
  end

  @doc """
  Gets a single client_setting.

  Raises `Ecto.NoResultsError` if the Client setting does not exist.

  ## Examples

      iex> get_client_setting!(123)
      %ClientSetting{}

      iex> get_client_setting!(456)
      ** (Ecto.NoResultsError)

  """
  def get_client_setting!(id), do: Repo.get!(ClientSetting, id)

  @doc """
  Creates a client_setting.

  ## Examples

      iex> create_client_setting(%{field: value})
      {:ok, %ClientSetting{}}

      iex> create_client_setting(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_client_setting(attrs \\ %{}) do
    %ClientSetting{}
    |> ClientSetting.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a client_setting.

  ## Examples

      iex> update_client_setting(client_setting, %{field: new_value})
      {:ok, %ClientSetting{}}

      iex> update_client_setting(client_setting, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_client_setting(%ClientSetting{} = client_setting, attrs) do
    client_setting
    |> ClientSetting.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a client_setting.

  ## Examples

      iex> delete_client_setting(client_setting)
      {:ok, %ClientSetting{}}

      iex> delete_client_setting(client_setting)
      {:error, %Ecto.Changeset{}}

  """
  def delete_client_setting(%ClientSetting{} = client_setting) do
    Repo.delete(client_setting)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking client_setting changes.

  ## Examples

      iex> change_client_setting(client_setting)
      %Ecto.Changeset{data: %ClientSetting{}}

  """
  def change_client_setting(%ClientSetting{} = client_setting, attrs \\ %{}) do
    ClientSetting.changeset(client_setting, attrs)
  end
end
