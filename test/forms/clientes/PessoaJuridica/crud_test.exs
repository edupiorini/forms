defmodule FormsTest.CRUD do
  use Forms.DataCase, async: true

  import FormsTest.Factory

  alias Forms.{Error, PessoaJuridica}
  alias Forms.PessoaJuridica.{Create, Get, Update}

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

  describe "Update.call/1" do
    test "Updates an existing client when params are given and id is valid", %{cliente: cliente} do
      {:ok, %PessoaJuridica{id: id_cliente} = _created_client} = Create.call(cliente)

      params = %{"id" => id_cliente, "endereco" => "Endereco atualizado, 000, Deu certo"}

      response = Update.call(params)

      assert {:ok,
              %PessoaJuridica{
                id: _id,
                endereco: "Endereco atualizado, 000, Deu certo"
              }} = response
    end

    test "Returns an error when given id does not exist" do
      invalid_id = "c048e048-a7ec-4a86-b76f-d681a60a43a9"

      response = Update.call(%{"id" => invalid_id, "endereco" => "Não vai dar certo"})

      assert response ==
               {:error, %Forms.Error{result: "Usuário não encontrado!", status: :not_found}}
    end

    test "Returns an error when invalid id format is given" do
      invalid_id = "123465f"

      response = Update.call(%{"id" => invalid_id, "endereco" => "Não vai dar certo"})

      assert response == {:error, %Forms.Error{result: "ID Inválido!", status: :bad_request}}
    end
  end
end
