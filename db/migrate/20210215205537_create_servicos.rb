class CreateServicos < ActiveRecord::Migration[6.1]
  def change
    create_table :servicos do |t|
      t.string :prestador
      t.string :tipoServico
      t.string :saida
      t.string :retorno
      t.integer :qtd
      t.float :peso_saida
      t.float :peso_retorno
      t.decimal :totalServico
      t.string :ref_peca
      t.string :solicitante
      t.string :status
      t.integer :qtdAproduzir
      t.decimal :valorUnitarioServico

      t.timestamps
    end
  end
end
