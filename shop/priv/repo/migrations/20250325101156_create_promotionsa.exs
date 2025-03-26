defmodule Shop.Repo.Migrations.CreatePromotionsa do
  use Ecto.Migration

  def change do
    create table(:promotionsa) do
      add :name, :string
      add :code, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:promotionsa, [:code])
  end
end
