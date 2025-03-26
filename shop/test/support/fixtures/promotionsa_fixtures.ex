defmodule Shop.PromotionsaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Shop.Promotionsa` context.
  """

  @doc """
  Generate a unique promotiona code.
  """
  def unique_promotiona_code, do: "some code#{System.unique_integer([:positive])}"

  @doc """
  Generate a promotiona.
  """
  def promotiona_fixture(attrs \\ %{}) do
    {:ok, promotiona} =
      attrs
      |> Enum.into(%{
        code: unique_promotiona_code(),
        name: "some name"
      })
      |> Shop.Promotionsa.create_promotiona()

    promotiona
  end
end
