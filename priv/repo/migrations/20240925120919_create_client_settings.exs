defmodule LiveviewTasksApp.Repo.Migrations.AddSupplierAndStartDateToClientSettings do
  use Ecto.Migration

  def change do
    alter table(:client_settings) do
      add :supplier, :string
      add :start_date, :naive_datetime
    end
  end
end
