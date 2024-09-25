defmodule LiveviewTasksApp.ClientSettings.ClientSetting do
  use Ecto.Schema
  import Ecto.Changeset

  schema "client_settings" do
    field :time_offset, :integer
    field :bulk, :string
    field :supplier, :string
    field :start_date, :naive_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(client_setting, attrs) do
    client_setting
    |> cast(attrs, [:time_offset, :bulk, :supplier, :start_date])
    |> validate_required([:time_offset, :bulk])
  end
end
