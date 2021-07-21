defmodule Forms.PessoaJuridica.Delete do
  alias Forms.{PessoaJuridica, Repo}

  def call(id) do
    with {:ok, cliente} <- PessoaJuridica.Get.call(id) do
      Repo.delete!(cliente)
    else
      {:error, _reason} = error -> error
    end
  end
end
