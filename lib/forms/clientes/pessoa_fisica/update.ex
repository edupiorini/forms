defmodule Forms.PessoaFisica.Update do
  alias Forms.PessoaFisica.Get
  alias Forms.Error
  alias Forms.Repo

  def call(
        id,
        %{
          nome: _nome,
          cidade: _cidade,
          cpf: _cpf,
          email: _email,
          endereco: _endereco,
          estado: _estado,
          telefone: _telefone
        } = params
      ) do
    case Get.call(id) do
      {:ok, cliente} -> do_update(cliente, params)
      %Error{} = error -> error
    end
  end

  def call(_, %{id: _id}), do: {:error, Error.build(:forbidden, "ID não pode ser alterado")}

  def call(_id, _) do
    {:error, Error.build(:bad_request, "Parametro inválido!")}
  end

  defp do_update(client, params) do
    client
    |> Ecto.Changeset.change(params)
    |> Repo.update()
  end
end
