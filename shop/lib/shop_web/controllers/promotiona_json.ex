defmodule ShopWeb.PromotionaJSON do
  alias Shop.Promotionsa.Promotiona

  @doc """
  Renders a list of promotionsa.
  """
  def index(%{promotionsa: promotionsa}) do
    %{data: for(promotiona <- promotionsa, do: data(promotiona))}
  end

  @doc """
  Renders a single promotiona.
  """
  def show(%{promotiona: promotiona}) do
    %{data: data(promotiona)}
  end

  defp data(%Promotiona{} = promotiona) do
    %{
      id: promotiona.id,
      name: promotiona.name,
      code: promotiona.code,
      displayName: promotiona.name <> promotiona.code
    }
  end
end
