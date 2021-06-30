defmodule Forms do
  alias Forms.Clientes.PessoaFisica.Create, as: CreatePessoaFisica
  alias Forms.Clientes.PessoaJuridica.Create, as: CreatePessoaJuridica

  @moduledoc """
  Forms keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defdelegate create_pessoa_fisica(params), to: CreatePessoaFisica, as: :call
  defdelegate create_pessoa_juridica(params), to: CreatePessoaJuridica, as: :call
end
