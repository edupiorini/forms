defmodule FormsWeb.PessoaFisicaView do
  use FormsWeb, :view

  alias Forms.PessoaFisica

  def render("create.json", %{cliente: %PessoaFisica{} = cliente}) do
    %{
      mensagem: "Cliente criado com sucesso!",
      cliente: cliente
    }
  end
end
