defmodule LiveviewTasksApp.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :description, :string
    field :title, :string
    field :raised_date, :naive_datetime
    field :time_complete, :naive_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :raised_date, :time_complete])
    |> validate_required([:title, :description, :raised_date, :time_complete])
  end
end
