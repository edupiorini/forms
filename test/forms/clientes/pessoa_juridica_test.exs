defmodule FormsTest.PessoaJuridica do
  use ExUnit.Case

  import FormsTest.Factory

  alias Ecto.Changeset
  alias Forms.PessoaJuridica

  describe "changeset/2" do
    setup do
      cliente = build(:pjuridica_params)

      {:ok, cliente: cliente}
    end

    test "when valid params are given, returns a changeset", %{cliente: cliente} do
      response = PessoaJuridica.changeset(cliente)

      assert %Changeset{changes: %{razao_social: "Empresa de Teste INC"}, valid?: true} = response
    end

    test "when new params are given, updates the changeset", %{cliente: cliente} do
      updated_params = %{"razao_social" => "Razao atualizada"}

      response =
        cliente
        |> PessoaJuridica.changeset()
        |> PessoaJuridica.changeset(updated_params)

      assert %Changeset{changes: %{razao_social: "Razao atualizada"}, valid?: true} = response
    end

    test "when invalid params are given, returns a changeset with error" do
      wrong_params = %{"razao_social" => "ANY"}

      response =
        wrong_params
        |> PessoaJuridica.changeset()

      assert %Changeset{changes: _any_changes, valid?: false} = response
    end
  end
end
