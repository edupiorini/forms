defmodule FormsWeb.PessoaFisicaController do
  use FormsWeb, :controller

  alias Forms.PessoaFisica

  def create(conn, params) do
    with {:ok, %PessoaFisica{} = cliente} <- Forms.create_pessoa_fisica(params) do
      conn
      |> put_status(:created)
      |> render("create.json", cliente: cliente)
    end
  end
end
