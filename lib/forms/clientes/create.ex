defmodule Forms.Clientes.Create do
  alias Forms.{PessoaFisica, PessoaJuridica, Repo}

  def call(params) do
    case get_params(params) do
      %{cpf: _} = params -> handle_create_pessoa_fisica(params)
      %{cnpj: _} = params -> handle_create_pessoa_juridica(params)
    end
  end

  defp get_params(params) do
    params
  end

  defp handle_create_pessoa_fisica(params) do
    params
    |> PessoaFisica.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_create_pessoa_juridica(params) do
    params
    |> PessoaJuridica.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, _} = result), do: result
end
