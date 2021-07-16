defmodule Forms.Error do
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def build_user_not_found_error, do: build(:not_found, "Usuário não encontrado!")

  def build_invalid_id, do: build(:bad_request, "ID Inválido!")
end
