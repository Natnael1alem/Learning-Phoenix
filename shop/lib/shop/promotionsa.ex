defmodule Shop.Promotionsa do
  @moduledoc """
  The Promotionsa context.
  """

  import Ecto.Query, warn: false
  alias Shop.Repo

  alias Shop.Promotionsa.Promotiona

  @doc """
  Returns the list of promotionsa.

  ## Examples

      iex> list_promotionsa()
      [%Promotiona{}, ...]

  """
  def list_promotionsa do
    Repo.all(Promotiona)
  end

  @doc """
  Gets a single promotiona.

  Raises `Ecto.NoResultsError` if the Promotiona does not exist.

  ## Examples

      iex> get_promotiona!(123)
      %Promotiona{}

      iex> get_promotiona!(456)
      ** (Ecto.NoResultsError)

  """
  def get_promotiona!(id), do: Repo.get!(Promotiona, id)

  @doc """
  Creates a promotiona.

  ## Examples

      iex> create_promotiona(%{field: value})
      {:ok, %Promotiona{}}

      iex> create_promotiona(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_promotiona(attrs \\ %{}) do
    %Promotiona{}
    |> Promotiona.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a promotiona.

  ## Examples

      iex> update_promotiona(promotiona, %{field: new_value})
      {:ok, %Promotiona{}}

      iex> update_promotiona(promotiona, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_promotiona(%Promotiona{} = promotiona, attrs) do
    promotiona
    |> Promotiona.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a promotiona.

  ## Examples

      iex> delete_promotiona(promotiona)
      {:ok, %Promotiona{}}

      iex> delete_promotiona(promotiona)
      {:error, %Ecto.Changeset{}}

  """
  def delete_promotiona(%Promotiona{} = promotiona) do
    Repo.delete(promotiona)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking promotiona changes.

  ## Examples

      iex> change_promotiona(promotiona)
      %Ecto.Changeset{data: %Promotiona{}}

  """
  def change_promotiona(%Promotiona{} = promotiona, attrs \\ %{}) do
    Promotiona.changeset(promotiona, attrs)
  end
end
