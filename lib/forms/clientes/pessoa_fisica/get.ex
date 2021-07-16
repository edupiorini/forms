defmodule Forms.PessoaFisica.Get do
  alias Ecto.UUID
  alias Forms.{Error, PessoaFisica, Repo}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_invalid_id()}
      {:ok, id} -> get(id)
    end
  end

  defp get(id) do
    case Repo.get(PessoaFisica, id) do
      %PessoaFisica{} = cliente -> {:ok, cliente}
      nil -> {:error, Error.build_user_not_found_error()}
    end
  end
end
