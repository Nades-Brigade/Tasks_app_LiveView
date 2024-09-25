defmodule LiveviewTasksAppWeb.ClientSettingLive.Index do
  use LiveviewTasksAppWeb, :live_view

  alias LiveviewTasksApp.ClientSettings
  alias LiveviewTasksApp.ClientSettings.ClientSetting

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :client_settings, ClientSettings.list_client_settings())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Client setting")
    |> assign(:client_setting, ClientSettings.get_client_setting!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Client setting")
    |> assign(:client_setting, %ClientSetting{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Client settings")
    |> assign(:client_setting, nil)
  end

  @impl true
  def handle_info({LiveviewTasksAppWeb.ClientSettingLive.FormComponent, {:saved, client_setting}}, socket) do
    {:noreply, stream_insert(socket, :client_settings, client_setting)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    client_setting = ClientSettings.get_client_setting!(id)
    {:ok, _} = ClientSettings.delete_client_setting(client_setting)

    {:noreply, stream_delete(socket, :client_settings, client_setting)}
  end
end
