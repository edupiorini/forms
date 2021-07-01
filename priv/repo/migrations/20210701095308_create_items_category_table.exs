defmodule Forms.Repo.Migrations.CreateItemsCategoryTable do
  use Ecto.Migration

  def change do
    up_query = "CREATE TYPE item_category AS ENUM ('toldo_fixo', 'toldo_retratil', 'cortina', 'capota', 'capota_alpina', 'garagem', 'toldo_automatico', 'passarela')"
    down_query = "DROP TYPE item_category"

    execute(up_query, down_query)
  end
end
