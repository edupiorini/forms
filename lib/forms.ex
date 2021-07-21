defmodule Forms do
  alias Forms.PessoaFisica.Create, as: CreatePessoaFisica
  alias Forms.PessoaFisica.Get, as: GetPessoaFisica
  alias Forms.PessoaJuridica.Create, as: CreatePessoaJuridica
  alias Forms.PessoaJuridica.Get, as: GetPessoaJuridica
  alias Forms.PessoaFisica.Update, as: UpdatePessoaFisica
  alias Forms.PessoaJuridica.Update, as: UpdatePessoaJuridica
  alias Forms.PessoaFisica.Delete, as: DeletePessoaFisica
  alias Forms.PessoaJuridica.Delete, as: DeletePessoaJuridica

  @moduledoc """
  Forms keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defdelegate create_pessoa_fisica(params), to: CreatePessoaFisica, as: :call
  defdelegate create_pessoa_juridica(params), to: CreatePessoaJuridica, as: :call
  defdelegate get_pessoa_fisica(id), to: GetPessoaFisica, as: :call
  defdelegate get_pessoa_juridica(id), to: GetPessoaJuridica, as: :call
  defdelegate update_pessoa_fisica(params), to: UpdatePessoaFisica, as: :call
  defdelegate update_pessoa_juridica(params), to: UpdatePessoaJuridica, as: :call
  defdelegate delete_pessoa_fisica(id), to: DeletePessoaFisica, as: :call
  defdelegate delete_pessoa_juridica(id), to: DeletePessoaJuridica, as: :call
end
