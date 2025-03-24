defmodule ShopWeb.RandomHTML do
  use ShopWeb, :html

  embed_templates "random_html/*"

  # def random(assigns) do
  #   ~H"""
  #     <h1>This is the random from inline rendering</h1>
  #   """
  # end

end
