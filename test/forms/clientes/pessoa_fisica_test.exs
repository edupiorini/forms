defmodule FormsTest.PessoaFisica do
  use ExUnit.Case

  import FormsTest.Factory

  alias Forms.PessoaFisica
  alias Ecto.Changeset

  describe "changeset/2" do
    setup do
      cliente = build(:pfisica_params)

      {:ok, cliente: cliente}
    end

    test "when valid params are given, returns a changeset", %{cliente: cliente} do
      response = PessoaFisica.changeset(cliente)

      assert %Changeset{changes: %{nome: "Cliente de Teste"}, valid?: true} = response
    end

    test "when given new params, updates the changeset", %{cliente: cliente} do
      updated_params = %{
        "nome" => "Cliente Atualizado"
      }

      response =
        cliente
        |> PessoaFisica.changeset()
        |> PessoaFisica.changeset(updated_params)

      assert %Changeset{changes: %{nome: "Cliente Atualizado"}, valid?: true} = response
    end

    test "when invalid params are given, returns a changeset with an error" do
      cliente = %{"nome" => "Cliente Errado"}

      response = PessoaFisica.changeset(cliente)

      assert %Changeset{changes: _changes, valid?: false} = response
    end
  end
end
