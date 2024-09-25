defmodule LiveviewTasksAppWeb.ClientSettingLive.FormComponent do
  use LiveviewTasksAppWeb, :live_component

  alias LiveviewTasksApp.ClientSettings

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage client_setting records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="client_setting-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:time_offset]} type="number" label="Time offset" />
        <.input field={@form[:bulk]} type="text" label="Bulk" />
        <.input field={@form[:supplier]} type="text" label="Supplier" />
        <.input field={@form[:start_date]} type="datetime-local" label="Start Date" />

        <:actions>
          <.button phx-disable-with="Saving...">Save Client setting</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{client_setting: client_setting} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(ClientSettings.change_client_setting(client_setting))
     end)}
  end

  @impl true
  def handle_event("validate", %{"client_setting" => client_setting_params}, socket) do
    changeset = ClientSettings.change_client_setting(socket.assigns.client_setting, client_setting_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  @impl true
  def handle_event("save", %{"client_setting" => client_setting_params}, socket) do
    save_client_setting(socket, socket.assigns.action, client_setting_params)
  end

  defp save_client_setting(socket, :edit, client_setting_params) do
    case ClientSettings.update_client_setting(socket.assigns.client_setting, client_setting_params) do
      {:ok, client_setting} ->
        notify_parent({:saved, client_setting})

        {:noreply,
         socket
         |> put_flash(:info, "Client setting updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_client_setting(socket, :new, client_setting_params) do
    case ClientSettings.create_client_setting(client_setting_params) do
      {:ok, client_setting} ->
        notify_parent({:saved, client_setting})

        {:noreply,
         socket
         |> put_flash(:info, "Client setting created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
