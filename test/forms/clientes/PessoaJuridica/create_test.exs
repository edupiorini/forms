defmodule FormsTest.Create do
  use Forms.DataCase, async: true

  import FormsTest.Factory

  alias Forms.{Error, PessoaJuridica}
  alias Forms.PessoaJuridica.{Create, Get}

  setup_all do
    cliente = build(:pjuridica_params)

    {:ok, cliente: cliente}
  end

  describe "Create.call/1" do
    test "when given valid params, creates a pessoa juridica", %{cliente: cliente} do
      response = Create.call(cliente)

      assert {:ok, %PessoaJuridica{id: _id}} = response
    end

    test "returns an error if wrong params are given" do
      wrong_params = %{"razao_social" => "razao"}

      response = Create.call(wrong_params)

      assert {:error, %Error{result: _result}} = response
    end
  end

  describe "Get.call/1" do
    test "when a valid id is given, returns a cliente", %{cliente: cliente} do
      {:ok, %PessoaJuridica{id: id}} = Create.call(cliente)

      response = Get.call(id)

      assert {:ok, %PessoaJuridica{id: _id, razao_social: "Empresa de Teste INC"}} = response
    end

    test "returns an error when id is not found" do
      unexitent_id = "9e3d3beb-6757-49ab-ba56-b5fddf121755"

      response = Get.call(unexitent_id)

      expected_response = %Error{result: "Usuário não encontrado!", status: :not_found}

      assert response == expected_response
    end

    test "returns an error when id format is wrong" do
      wrong_id = "263816sdf"

      response = Get.call(wrong_id)

      expected_response = {:error, %Error{result: "ID Inválido!", status: :bad_request}}

      assert response == expected_response
    end
  end
end
