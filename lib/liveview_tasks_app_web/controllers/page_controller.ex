defmodule LiveviewTasksAppWeb.PageController do
  use LiveviewTasksAppWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: false)
  end
end
