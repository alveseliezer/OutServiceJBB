class ListController < ApplicationController
  
  def lista
    @busca = "%#{params[:search]}%"   
    @servicos = Servico.where("prestador LIKE ?", @busca).where("status LIKE 'Criado'")
    
    @total_servico = 0
    @servicos.each do |s|
       if s.valorUnitarioServico == nil and s.qtd == nil 
       @total_servico  = 0 
       end 
       if s.valorUnitarioServico != nil and s.qtd != nil 
        @total_servico  = @total_servico  + s.totalServico.to_i
       end 
    end
  end

  def geral 
    @geral = Servico.all.order(created_at: :desc)
    @busca = "%#{params[:search]}%"   
    @geral = Servico.where("prestador LIKE ?", @busca)
    @teste = params[:id]
    puts @teste
  end
  
end
