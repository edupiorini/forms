defmodule FormsWeb.PessoaFisicaController do
  use FormsWeb, :controller

  alias Forms.PessoaFisica
  alias FormsWeb.ClienteView

  action_fallback FormsWeb.FallbackController

  def create(conn, params) do
    with {:ok, %PessoaFisica{} = cliente} <- Forms.create_pessoa_fisica(params) do
      conn
      |> put_status(:created)
      |> put_view(ClienteView)
      |> render("create.json", cliente: cliente)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, cliente} <- Forms.get_pessoa_fisica(id) do
      conn
      |> put_status(:ok)
      |> put_view(ClienteView)
      |> render("cliente.json", cliente: cliente)
    end
  end
end
