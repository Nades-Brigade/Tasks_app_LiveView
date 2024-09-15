defmodule LiveviewTasksApp.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :description, :text
      add :raised_date, :naive_datetime
      add :time_complete, :naive_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
