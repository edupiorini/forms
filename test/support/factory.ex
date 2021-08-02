defmodule FormsTest.Factory do
  use ExMachina.Ecto, repo: Forms.Repo

  # alias Forms.{PessoaFisica, PessoaJuridica}

  def pfisica_params_factory do
    %{
      "nome" => "Cliente de Teste",
      "cpf" => "00000000000",
      "email" => "clientedeteste@teste.com",
      "telefone" => ["12000000000"],
      "endereco" => "rua das bananas loucas, 689, Itaim",
      "cidade" => "Taubateste",
      "estado" => "SP"
    }
  end

  def pjuridica_params_factory do
    %{
      "razao_social" => "Empresa de Teste INC",
      "nome_fantasia" => "Testao",
      "cnpj" => "00000000000001",
      "email" => "empresadeteste@teste.com",
      "telefone" => ["1200000001"],
      "cidade" => "taubate",
      "estado" => "SP",
      "endereco" => "rua dos testes, 25, testelandia"
    }
  end
end
