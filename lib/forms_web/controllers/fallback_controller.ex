defmodule FormsWeb.FallbackController do
  use FormsWeb, :controller

  alias Forms.Error
  alias FormsWeb.ErrorView

  def call(conn, %Error{status: status, result: result}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
