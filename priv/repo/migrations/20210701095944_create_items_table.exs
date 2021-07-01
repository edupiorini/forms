defmodule Forms.Repo.Migrations.CreateItemsTable do
  use Ecto.Migration

  def change do
    create table("items") do
      add :description, :string
      add :category, :item_category
      add :value, :decimal

      timestamps()
    end
  end
end
