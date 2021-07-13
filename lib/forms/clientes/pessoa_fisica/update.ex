defmodule Forms.PessoaFisica.Update do
  alias Ecto.UUID
  alias Forms.PessoaFisica
  alias Forms.Error
  alias Forms.Repo

  def call(%{"id" => id} = params) do
    case UUID.cast(id) do
      :error -> {:erro, "ID inválido!"}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => id} = params) do
    case Repo.get(PessoaFisica, id) do
      nil -> {:erro, Error.build_user_not_found_error()}
      cliente -> do_update(cliente, params)
    end
  end

  defp do_update(client, params) do
    client
    |> PessoaFisica.changeset(params)
    |> Repo.update()
  end
end