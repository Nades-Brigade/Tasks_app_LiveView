defmodule LiveviewTasksApp.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveviewTasksApp.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        description: "some description",
        raised_date: ~N[2024-09-14 11:35:00],
        time_complete: ~N[2024-09-14 11:35:00],
        title: "some title"
      })
      |> LiveviewTasksApp.Tasks.create_task()

    task
  end
end
