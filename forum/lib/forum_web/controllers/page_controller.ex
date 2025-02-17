defmodule ForumWeb.PageController do
  use ForumWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
  
  def users(conn, _params) do
    IO.puts("the users controller has been invoked")

    users = [
      %{id: 1, name: "Alice", email: "alice@gmail.co"},
      %{id: 2, name: "Joe", email: "joe@gmail.co"},
      %{id: 3, name: "Mark", email: "mark@gmail.co"},
      %{id: 4, name: "John", email: "john@gmail.co"},
    ]

    # render(conn, :users, users: users, layout: false) #only use for non-spa
    json(conn, users: users) #spa friendly
  end
end
