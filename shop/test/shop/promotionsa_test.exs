defmodule Shop.PromotionsaTest do
  use Shop.DataCase

  alias Shop.Promotionsa

  describe "promotionsa" do
    alias Shop.Promotionsa.Promotiona

    import Shop.PromotionsaFixtures

    @invalid_attrs %{code: nil, name: nil}

    test "list_promotionsa/0 returns all promotionsa" do
      promotiona = promotiona_fixture()
      assert Promotionsa.list_promotionsa() == [promotiona]
    end

    test "get_promotiona!/1 returns the promotiona with given id" do
      promotiona = promotiona_fixture()
      assert Promotionsa.get_promotiona!(promotiona.id) == promotiona
    end

    test "create_promotiona/1 with valid data creates a promotiona" do
      valid_attrs = %{code: "some code", name: "some name"}

      assert {:ok, %Promotiona{} = promotiona} = Promotionsa.create_promotiona(valid_attrs)
      assert promotiona.code == "some code"
      assert promotiona.name == "some name"
    end

    test "create_promotiona/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Promotionsa.create_promotiona(@invalid_attrs)
    end

    test "update_promotiona/2 with valid data updates the promotiona" do
      promotiona = promotiona_fixture()
      update_attrs = %{code: "some updated code", name: "some updated name"}

      assert {:ok, %Promotiona{} = promotiona} = Promotionsa.update_promotiona(promotiona, update_attrs)
      assert promotiona.code == "some updated code"
      assert promotiona.name == "some updated name"
    end

    test "update_promotiona/2 with invalid data returns error changeset" do
      promotiona = promotiona_fixture()
      assert {:error, %Ecto.Changeset{}} = Promotionsa.update_promotiona(promotiona, @invalid_attrs)
      assert promotiona == Promotionsa.get_promotiona!(promotiona.id)
    end

    test "delete_promotiona/1 deletes the promotiona" do
      promotiona = promotiona_fixture()
      assert {:ok, %Promotiona{}} = Promotionsa.delete_promotiona(promotiona)
      assert_raise Ecto.NoResultsError, fn -> Promotionsa.get_promotiona!(promotiona.id) end
    end

    test "change_promotiona/1 returns a promotiona changeset" do
      promotiona = promotiona_fixture()
      assert %Ecto.Changeset{} = Promotionsa.change_promotiona(promotiona)
    end
  end
end
