defmodule FormsWeb.PessoaFisicaView do
  use FormsWeb, :view

  alias Forms.PessoaFisica

  def render("create.json", %{cliente: %PessoaFisica{} = cliente}) do
    %{
      mensagem: "Cliente criado com sucesso!",
      cliente: cliente
    }
  end

  def render("pessoa_fisica.json", %{cliente: %PessoaFisica{} = cliente}) do
    %{
      cliente: cliente
    }
  end
end
