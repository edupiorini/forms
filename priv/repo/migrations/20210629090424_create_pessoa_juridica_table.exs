defmodule Forms.Repo.Migrations.CreatePessoaJuridicaTable do
  use Ecto.Migration

  def change do
    create table(:pessoa_juridica) do
      add(:nome_fantasia, :string)
      add(:razao_social, :string)
      add(:endereco, :string)
      add(:cidade, :string)
      add(:estado, :string)
      add(:telefone, {:array, :string})
      add(:cnpj, :string)
      add(:email, :string)

      timestamps()
    end

    create(unique_index(:pessoa_juridica, [:cnpj]))
    create(unique_index(:pessoa_juridica, [:telefone]))
    create(unique_index(:pessoa_juridica, [:razao_social]))
  end
end
