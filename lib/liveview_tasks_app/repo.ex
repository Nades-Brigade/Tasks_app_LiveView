defmodule LiveviewTasksApp.Repo do
  use Ecto.Repo,
    otp_app: :liveview_tasks_app,
    adapter: Ecto.Adapters.Postgres
end
