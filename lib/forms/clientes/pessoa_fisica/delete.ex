defmodule Forms.PessoaFisica.Delete do
  alias Forms.{PessoaFisica, Repo}

  def call(id) do
    with {:ok, cliente} <- PessoaFisica.Get.call(id) do
      Repo.delete!(cliente)
    else
      {:error, _reason} = error -> error
    end
  end
end
