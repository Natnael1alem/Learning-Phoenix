defmodule ShopWeb.ProductsHTML do
  use ShopWeb, :html
  alias Shop.Products.Product

  embed_templates "products_html/*"

  attr :product, Product, required: true

  def product(assigns) do
    ~H"""
    <.link href={~p"/products/#{@product.slug}"} class="block"> {@product.name}</.link>
    """
  end

  # def index(assigns) do
  #   ~H"""
  #   <h1> Inline Text Index route </h1>
  #   """
  # end
end
