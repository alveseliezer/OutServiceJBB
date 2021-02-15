class AddValorUnitarioServicoToServicos < ActiveRecord::Migration[6.1]
  def change
    add_column :servicos, :valorUnitarioServico, :decimal
  end
end
