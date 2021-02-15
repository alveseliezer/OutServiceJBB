require "application_system_test_case"

class ServicosTest < ApplicationSystemTestCase
  setup do
    @servico = servicos(:one)
  end

  test "visiting the index" do
    visit servicos_url
    assert_selector "h1", text: "Servicos"
  end

  test "creating a Servico" do
    visit servicos_url
    click_on "New Servico"

    fill_in "Peso retorno", with: @servico.peso_retorno
    fill_in "Peso saida", with: @servico.peso_saida
    fill_in "Prestador", with: @servico.prestador
    fill_in "Qtd", with: @servico.qtd
    fill_in "Qtdaproduzir", with: @servico.qtdAproduzir
    fill_in "Ref peca", with: @servico.ref_peca
    fill_in "Retorno", with: @servico.retorno
    fill_in "Saida", with: @servico.saida
    fill_in "Solicitante", with: @servico.solicitante
    fill_in "Status", with: @servico.status
    fill_in "Tiposervico", with: @servico.tipoServico
    fill_in "Totalservico", with: @servico.totalServico
    click_on "Create Servico"

    assert_text "Servico was successfully created"
    click_on "Back"
  end

  test "updating a Servico" do
    visit servicos_url
    click_on "Edit", match: :first

    fill_in "Peso retorno", with: @servico.peso_retorno
    fill_in "Peso saida", with: @servico.peso_saida
    fill_in "Prestador", with: @servico.prestador
    fill_in "Qtd", with: @servico.qtd
    fill_in "Qtdaproduzir", with: @servico.qtdAproduzir
    fill_in "Ref peca", with: @servico.ref_peca
    fill_in "Retorno", with: @servico.retorno
    fill_in "Saida", with: @servico.saida
    fill_in "Solicitante", with: @servico.solicitante
    fill_in "Status", with: @servico.status
    fill_in "Tiposervico", with: @servico.tipoServico
    fill_in "Totalservico", with: @servico.totalServico
    click_on "Update Servico"

    assert_text "Servico was successfully updated"
    click_on "Back"
  end

  test "destroying a Servico" do
    visit servicos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Servico was successfully destroyed"
  end
end
