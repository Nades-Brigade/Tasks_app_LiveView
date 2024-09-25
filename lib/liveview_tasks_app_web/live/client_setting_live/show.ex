defmodule LiveviewTasksAppWeb.ClientSettingLive.Show do
  use LiveviewTasksAppWeb, :live_view

  alias LiveviewTasksApp.ClientSettings

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:client_setting, ClientSettings.get_client_setting!(id))}
  end

  defp page_title(:show), do: "Show Client setting"
  defp page_title(:edit), do: "Edit Client setting"
end
