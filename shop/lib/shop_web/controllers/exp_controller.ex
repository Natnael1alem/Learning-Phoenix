defmodule ShopWeb.ExpController do
  use ShopWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
