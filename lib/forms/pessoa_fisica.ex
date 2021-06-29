defmodule Forms.PessoaFisica do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:nome, :endereco, :estado, :telefone, :cpf, :cidade]

  @derive {Jason.Encoder, only: @required_params}

  schema "pessoa_fisica" do
    field :nome, :string
    field :endereco, :string
    field :cidade, :string
    field :estado, :string
    field :telefone, {:array, :string}
    field :cpf, :string
    field :email, :string

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params ++ [:email])
    |> validate_required(@required_params)
    |> validate_length(:nome, min: 2)
    |> validate_length(:endereco, min: 6)
    |> validate_length(:cidade, min: 2)
    |> validate_length(:estado, min: 2)
    |> validate_length(:telefone, min: 1)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:cpf])
    |> unique_constraint([:telefone])
  end
end
