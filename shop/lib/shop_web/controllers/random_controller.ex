defmodule ShopWeb.RandomController do
  use ShopWeb, :controller

  def random(conn, _params) do
    render(conn, :random)
    # html(conn, "<html><body>Try HTML</body></html>")
    # json(conn, %{message: "This is a map"})
  end
end
