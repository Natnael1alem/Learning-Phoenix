defmodule Shop.Promotionsa.Promotiona do
  use Ecto.Schema
  import Ecto.Changeset

  schema "promotionsa" do
    field :code, :string
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(promotiona, attrs) do
    promotiona
    |> cast(attrs, [:name, :code])
    |> validate_required([:name, :code])
    |> unique_constraint(:code)
  end
end
