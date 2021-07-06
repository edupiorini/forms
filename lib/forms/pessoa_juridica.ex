defmodule Forms.PessoaJuridica do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [
    :nome_fantasia,
    :razao_social,
    :email,
    :endereco,
    :estado,
    :telefone,
    :cnpj,
    :cidade
  ]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "pessoa_juridica" do
    field :nome_fantasia, :string
    field :razao_social, :string
    field :endereco, :string
    field :cidade, :string
    field :estado, :string
    field :telefone, {:array, :string}
    field :cnpj, :string
    field :email, :string

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:nome_fantasia, min: 2)
    |> validate_length(:endereco, min: 6)
    |> validate_length(:cidade, min: 2)
    |> validate_length(:estado, min: 2)
    |> validate_length(:telefone, min: 1)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:cnpj])
    |> unique_constraint([:telefone])
    |> unique_constraint([:razao_social])
  end
end
