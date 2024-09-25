defmodule LiveviewTasksAppWeb.ClientSettingLiveTest do
  use LiveviewTasksAppWeb.ConnCase

  import Phoenix.LiveViewTest
  import LiveviewTasksApp.ClientSettingsFixtures

  @create_attrs %{time_offset: 42, bulk: "some bulk"}
  @update_attrs %{time_offset: 43, bulk: "some updated bulk"}
  @invalid_attrs %{time_offset: nil, bulk: nil}

  defp create_client_setting(_) do
    client_setting = client_setting_fixture()
    %{client_setting: client_setting}
  end

  describe "Index" do
    setup [:create_client_setting]

    test "lists all client_settings", %{conn: conn, client_setting: client_setting} do
      {:ok, _index_live, html} = live(conn, ~p"/client_settings")

      assert html =~ "Listing Client settings"
      assert html =~ client_setting.bulk
    end

    test "saves new client_setting", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/client_settings")

      assert index_live |> element("a", "New Client setting") |> render_click() =~
               "New Client setting"

      assert_patch(index_live, ~p"/client_settings/new")

      assert index_live
             |> form("#client_setting-form", client_setting: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#client_setting-form", client_setting: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/client_settings")

      html = render(index_live)
      assert html =~ "Client setting created successfully"
      assert html =~ "some bulk"
    end

    test "updates client_setting in listing", %{conn: conn, client_setting: client_setting} do
      {:ok, index_live, _html} = live(conn, ~p"/client_settings")

      assert index_live |> element("#client_settings-#{client_setting.id} a", "Edit") |> render_click() =~
               "Edit Client setting"

      assert_patch(index_live, ~p"/client_settings/#{client_setting}/edit")

      assert index_live
             |> form("#client_setting-form", client_setting: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#client_setting-form", client_setting: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/client_settings")

      html = render(index_live)
      assert html =~ "Client setting updated successfully"
      assert html =~ "some updated bulk"
    end

    test "deletes client_setting in listing", %{conn: conn, client_setting: client_setting} do
      {:ok, index_live, _html} = live(conn, ~p"/client_settings")

      assert index_live |> element("#client_settings-#{client_setting.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#client_settings-#{client_setting.id}")
    end
  end

  describe "Show" do
    setup [:create_client_setting]

    test "displays client_setting", %{conn: conn, client_setting: client_setting} do
      {:ok, _show_live, html} = live(conn, ~p"/client_settings/#{client_setting}")

      assert html =~ "Show Client setting"
      assert html =~ client_setting.bulk
    end

    test "updates client_setting within modal", %{conn: conn, client_setting: client_setting} do
      {:ok, show_live, _html} = live(conn, ~p"/client_settings/#{client_setting}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Client setting"

      assert_patch(show_live, ~p"/client_settings/#{client_setting}/show/edit")

      assert show_live
             |> form("#client_setting-form", client_setting: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#client_setting-form", client_setting: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/client_settings/#{client_setting}")

      html = render(show_live)
      assert html =~ "Client setting updated successfully"
      assert html =~ "some updated bulk"
    end
  end
end
