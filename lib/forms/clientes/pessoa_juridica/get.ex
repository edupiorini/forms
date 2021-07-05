defmodule Forms.PessoaJuridica.Get do
  alias Ecto.UUID
  alias Forms.{Error, PessoaJuridica, Repo}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Formato de Id inválido"}
      {:ok, id} -> get(id)
    end
  end

  defp get(id) do
    case Repo.get(PessoaJuridica, id) do
      %PessoaJuridica{} = cliente -> {:ok, cliente}
      nil -> Error.build_user_not_found_error()
    end
  end
end
