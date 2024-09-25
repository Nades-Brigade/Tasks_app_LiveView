defmodule LiveviewTasksApp.ClientSettingsTest do
  use LiveviewTasksApp.DataCase

  alias LiveviewTasksApp.ClientSettings

  describe "client_settings" do
    alias LiveviewTasksApp.ClientSettings.ClientSetting

    import LiveviewTasksApp.ClientSettingsFixtures

    @invalid_attrs %{time_offset: nil, bulk: nil}

    test "list_client_settings/0 returns all client_settings" do
      client_setting = client_setting_fixture()
      assert ClientSettings.list_client_settings() == [client_setting]
    end

    test "get_client_setting!/1 returns the client_setting with given id" do
      client_setting = client_setting_fixture()
      assert ClientSettings.get_client_setting!(client_setting.id) == client_setting
    end

    test "create_client_setting/1 with valid data creates a client_setting" do
      valid_attrs = %{time_offset: 42, bulk: "some bulk"}

      assert {:ok, %ClientSetting{} = client_setting} = ClientSettings.create_client_setting(valid_attrs)
      assert client_setting.time_offset == 42
      assert client_setting.bulk == "some bulk"
    end

    test "create_client_setting/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ClientSettings.create_client_setting(@invalid_attrs)
    end

    test "update_client_setting/2 with valid data updates the client_setting" do
      client_setting = client_setting_fixture()
      update_attrs = %{time_offset: 43, bulk: "some updated bulk"}

      assert {:ok, %ClientSetting{} = client_setting} = ClientSettings.update_client_setting(client_setting, update_attrs)
      assert client_setting.time_offset == 43
      assert client_setting.bulk == "some updated bulk"
    end

    test "update_client_setting/2 with invalid data returns error changeset" do
      client_setting = client_setting_fixture()
      assert {:error, %Ecto.Changeset{}} = ClientSettings.update_client_setting(client_setting, @invalid_attrs)
      assert client_setting == ClientSettings.get_client_setting!(client_setting.id)
    end

    test "delete_client_setting/1 deletes the client_setting" do
      client_setting = client_setting_fixture()
      assert {:ok, %ClientSetting{}} = ClientSettings.delete_client_setting(client_setting)
      assert_raise Ecto.NoResultsError, fn -> ClientSettings.get_client_setting!(client_setting.id) end
    end

    test "change_client_setting/1 returns a client_setting changeset" do
      client_setting = client_setting_fixture()
      assert %Ecto.Changeset{} = ClientSettings.change_client_setting(client_setting)
    end
  end
end
