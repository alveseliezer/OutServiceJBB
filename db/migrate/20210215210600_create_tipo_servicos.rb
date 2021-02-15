class CreateTipoServicos < ActiveRecord::Migration[6.1]
  def change
    create_table :tipo_servicos do |t|
      t.string :tipo_Servico
      t.decimal :valorUnitario
      t.decimal :valorTotal
      
      t.timestamps
    end
  end
end
