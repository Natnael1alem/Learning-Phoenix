defmodule ShopWeb.ProductsController do
  use ShopWeb, :controller
  alias Shop.{Repo, Product}

  # @products [
  #   %{id: "1", name: "God of War"},
  #   %{id: "2", name: "Skyrim"},
  #   %{id: "3", name: "Diablo 4"}
  # ]

  def index(conn, _params) do
    products = Repo.all(Product)

    conn
    |> assign(:products, products)
    |> render(:index)
  end

  def show(conn, %{"slug" => slug}) do
    product = Repo.get_by(Product, slug: slug)
    # product = Enum.find(@products, fn product -> product.id == id end)
    # product = %{id: 1, name: "God of War"}

    conn
    |> assign(:product, product)
    |> render(:show)
  end

end
