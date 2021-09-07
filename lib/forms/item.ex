defmodule Forms.Item do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:description, :category, :value]

  @items_categories [
    :toldo_fixo,
    :toldo_retratil,
    :cortina,
    :capota,
    :capota_alpina,
    :garagem,
    :toldo_automatico,
    :passarela
  ]
  schema "items" do
    field :description, :string
    field :category, Ecto.Enum, values: @items_categories
    field :value, :decimal
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 4)
    |> validate_number(:value, greater_than: 0)
  end
end
