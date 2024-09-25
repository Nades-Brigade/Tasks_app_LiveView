# Not sure what to add here but just put random data for tasks and client settings
alias LiveviewTasksApp.Repo
alias LiveviewTasksApp.Tasks.Task
alias LiveviewTasksApp.ClientSettings.ClientSetting

Repo.insert!(%Task{
  title: "First Task",
  description: "This is the first sample task.",
  raised_date: ~N[2024-09-10 08:00:00],
  time_complete: ~N[2024-09-10 12:00:00]
})

Repo.insert!(%Task{
  title: "Second Task",
  description: "This is the second sample task.",
  raised_date: ~N[2024-09-11 09:00:00],
  time_complete: ~N[2024-09-11 15:00:00]
})

Repo.insert!(%Task{
  title: "Third Task",
  description: "This is the third sample task.",
  raised_date: ~N[2024-09-12 10:00:00],
  time_complete: ~N[2024-09-12 16:00:00]
})

Repo.insert!(%ClientSetting{
  time_offset: 60,
  bulk: "Bulk setting 1",
  supplier: "Supplier A",
  start_date: ~N[2024-09-24 10:00:00]
})

Repo.insert!(%ClientSetting{
  time_offset: 120,
  bulk: "Bulk setting 2",
  supplier: "Supplier B",
  start_date: ~N[2024-09-25 11:00:00]
})

Repo.insert!(%ClientSetting{
  time_offset: 180,
  bulk: "Bulk setting 3",
  supplier: "Supplier C",
  start_date: ~N[2024-09-26 12:00:00]
})

IO.puts("Database seeded with sample Task and ClientSetting records.")
