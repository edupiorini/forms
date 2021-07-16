defmodule FormsWeb.PessoaJuridicaController do
  use FormsWeb, :controller

  alias Forms.PessoaJuridica
  alias FormsWeb.ClienteView

  action_fallback(FormsWeb.FallbackController)

  def create(conn, params) do
    with {:ok, %PessoaJuridica{} = cliente} <- Forms.create_pessoa_juridica(params) do
      conn
      |> put_status(:created)
      |> put_view(ClienteView)
      |> render("create.json", cliente: cliente)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, cliente} <- Forms.get_pessoa_juridica(id) do
      conn
      |> put_status(:ok)
      |> put_view(ClienteView)
      |> render("cliente.json", cliente: cliente)
    end
  end

  def update(conn, params) do
    with {:ok, %PessoaJuridica{} = cliente} <- Forms.update_pessoa_juridica(params) do
      conn
      |> put_status(:created)
      |> put_view(ClienteView)
      |> render("cliente.json", cliente: cliente)
    end
  end
end
