defmodule Forms.PessoaJuridica.Create do
  alias Forms.{Error, PessoaJuridica, Repo}

  def call(params) do
    params
    |> PessoaJuridica.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, _user} = result), do: result

  defp handle_insert({:error, result}), do: {:error, Error.build(:bad_request, result)}
end
