defmodule Forms.PessoaFisica.Create do
  alias Forms.{Error, PessoaFisica, Repo}

  def call(params) do
    params
    |> PessoaFisica.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, _result} = result), do: result

  defp handle_insert({:error, result}), do: {:error, Error.build(:bad_request, result)}
end
