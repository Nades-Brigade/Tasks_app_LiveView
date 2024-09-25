defmodule LiveviewTasksApp.ClientSettingsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveviewTasksApp.ClientSettings` context.
  """

  @doc """
  Generate a client_setting.
  """
  def client_setting_fixture(attrs \\ %{}) do
    {:ok, client_setting} =
      attrs
      |> Enum.into(%{
        bulk: "some bulk",
        time_offset: 42
      })
      |> LiveviewTasksApp.ClientSettings.create_client_setting()

    client_setting
  end
end
