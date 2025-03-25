defmodule ShopWeb.ProductsController do
  use ShopWeb, :controller

  alias Shop.Products

  # @products [
  #   %{id: "1", name: "God of War"},
  #   %{id: "2", name: "Skyrim"},
  #   %{id: "3", name: "Diablo 4"}
  # ]

  def index(conn, _params) do
    products = Products.list_products()

    conn
    |> assign(:products, products)
    |> render(:index)
  end

  def show(conn, %{"slug" => slug}) do
    #product = Repo.get_by(Product, slug: slug)
    product = Products.find_product_by_slug(slug)

    # product = Enum.find(@products, fn product -> product.id == id end)
    # product = %{id: 1, name: "God of War"}

    conn
    |> assign(:product, product)
    |> render(:show)
  end

end
