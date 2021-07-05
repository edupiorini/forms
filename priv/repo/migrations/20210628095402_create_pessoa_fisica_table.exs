defmodule Forms.Repo.Migrations.CreatePessoaFisicaTable do
  use Ecto.Migration

  def change do
    create table(:pessoa_fisica) do
      add(:nome, :string)
      add(:endereco, :string)
      add(:cidade, :string)
      add(:estado, :string)
      add(:telefone, {:array, :string})
      add(:cpf, :string)
      add(:email, :string)

      timestamps()
    end

    create(unique_index(:pessoa_fisica, [:cpf]))
    create(unique_index(:pessoa_fisica, [:telefone]))
  end
end
