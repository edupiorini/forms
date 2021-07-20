defmodule FormsWeb.ClienteView do
  use FormsWeb, :view

  # alias Forms.PessoaFisica

  def render("create.json", %{cliente: %{} = cliente}) do
    %{
      mensagem: "Cliente criado com sucesso!",
      cliente: cliente
    }
  end

  def render("cliente.json", %{cliente: %{} = cliente}) do
    %{
      cliente: cliente
    }
  end

  def render("delete.json", %{cliente: %{} = _cliente}) do
    %{
      mensagem: "Excluído com sucesso!"
    }
  end
end
