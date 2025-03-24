defmodule ShopWeb.ProductsJSON do
  def index(%{products: products}) do
    %{
      data: products,
    }
  end

  # def index(_assigns) do
  #   %{data: [
  #     %{name: "God of War"},
  #     %{name: "Skyrim"},
  #     %{name: "Halo"},
  #   ]}
  # end
end
