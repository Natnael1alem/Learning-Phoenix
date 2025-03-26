defmodule ShopWeb.PromotionaControllerTest do
  use ShopWeb.ConnCase

  import Shop.PromotionsaFixtures

  alias Shop.Promotionsa.Promotiona

  @create_attrs %{
    code: "some code",
    name: "some name"
  }
  @update_attrs %{
    code: "some updated code",
    name: "some updated name"
  }
  @invalid_attrs %{code: nil, name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all promotionsa", %{conn: conn} do
      conn = get(conn, ~p"/api/promotionsa")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create promotiona" do
    test "renders promotiona when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/promotionsa", promotiona: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/promotionsa/#{id}")

      assert %{
               "id" => ^id,
               "code" => "some code",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/promotionsa", promotiona: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update promotiona" do
    setup [:create_promotiona]

    test "renders promotiona when data is valid", %{conn: conn, promotiona: %Promotiona{id: id} = promotiona} do
      conn = put(conn, ~p"/api/promotionsa/#{promotiona}", promotiona: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/promotionsa/#{id}")

      assert %{
               "id" => ^id,
               "code" => "some updated code",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, promotiona: promotiona} do
      conn = put(conn, ~p"/api/promotionsa/#{promotiona}", promotiona: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete promotiona" do
    setup [:create_promotiona]

    test "deletes chosen promotiona", %{conn: conn, promotiona: promotiona} do
      conn = delete(conn, ~p"/api/promotionsa/#{promotiona}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/promotionsa/#{promotiona}")
      end
    end
  end

  defp create_promotiona(_) do
    promotiona = promotiona_fixture()
    %{promotiona: promotiona}
  end
end
