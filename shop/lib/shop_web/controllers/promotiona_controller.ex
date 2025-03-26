defmodule ShopWeb.PromotionaController do
  use ShopWeb, :controller

  alias Shop.Promotionsa
  alias Shop.Promotionsa.Promotiona

  action_fallback ShopWeb.FallbackController

  def index(conn, _params) do
    promotionsa = Promotionsa.list_promotionsa()
    render(conn, :index, promotionsa: promotionsa)
  end

  def create(conn, %{"promotiona" => promotiona_params}) do
    with {:ok, %Promotiona{} = promotiona} <- Promotionsa.create_promotiona(promotiona_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/promotionsa/#{promotiona}")
      |> render(:show, promotiona: promotiona)
    end
  end

  def show(conn, %{"id" => id}) do
    promotiona = Promotionsa.get_promotiona!(id)
    render(conn, :show, promotiona: promotiona)
  end

  def update(conn, %{"id" => id, "promotiona" => promotiona_params}) do
    promotiona = Promotionsa.get_promotiona!(id)

    with {:ok, %Promotiona{} = promotiona} <- Promotionsa.update_promotiona(promotiona, promotiona_params) do
      render(conn, :show, promotiona: promotiona)
    end
  end

  def delete(conn, %{"id" => id}) do
    promotiona = Promotionsa.get_promotiona!(id)

    with {:ok, %Promotiona{}} <- Promotionsa.delete_promotiona(promotiona) do
      send_resp(conn, :no_content, "")
    end
  end
end
