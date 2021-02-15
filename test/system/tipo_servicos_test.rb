require "application_system_test_case"

class TipoServicosTest < ApplicationSystemTestCase
  setup do
    @tipo_servico = tipo_servicos(:one)
  end

  test "visiting the index" do
    visit tipo_servicos_url
    assert_selector "h1", text: "Tipo Servicos"
  end

  test "creating a Tipo servico" do
    visit tipo_servicos_url
    click_on "New Tipo Servico"

    fill_in "References", with: @tipo_servico.references
    fill_in "Tipo servico", with: @tipo_servico.tipo_Servico
    fill_in "Valortotal", with: @tipo_servico.valorTotal
    fill_in "Valorunitario", with: @tipo_servico.valorUnitario
    click_on "Create Tipo servico"

    assert_text "Tipo servico was successfully created"
    click_on "Back"
  end

  test "updating a Tipo servico" do
    visit tipo_servicos_url
    click_on "Edit", match: :first

    fill_in "References", with: @tipo_servico.references
    fill_in "Tipo servico", with: @tipo_servico.tipo_Servico
    fill_in "Valortotal", with: @tipo_servico.valorTotal
    fill_in "Valorunitario", with: @tipo_servico.valorUnitario
    click_on "Update Tipo servico"

    assert_text "Tipo servico was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipo servico" do
    visit tipo_servicos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipo servico was successfully destroyed"
  end
end
