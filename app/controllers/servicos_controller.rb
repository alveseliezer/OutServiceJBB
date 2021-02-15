class ServicosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_servico, only: %i[ show edit update destroy ]

  # GET /servicos or /servicos.json
  def index
    #@servicos = Servico.all
    @servicos = Servico.where("status LIKE 'Criado'").order(created_at: :desc)
   
    @days = Date.tomorrow
    @calc_date =  Servico.select('retorno')
    @calc_date.each do |cd|
            if(cd.retorno == Date.tomorrow)
            flash[:alert]= 'Alerta! Há prazos a vencer amanhã!'
          end
    end
  end
  # Inclusões do projeto
  def list
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
    @geral = Servico.all
    @busca = "%#{params[:search]}%"   
    @geral = Servico.where("prestador LIKE ?", @busca)
    @teste = params[:id]
    puts @teste
  end
  ######################
  # GET /servicos/1 or /servicos/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf {render template: 'servicos/etiqueta', pdf: "ID_#{@servico.prestador}"}
            
    end
  end

  # GET /servicos/new
  def new
    @servico = Servico.new
  end

  # GET /servicos/1/edit
  def edit
  end

  # POST /servicos or /servicos.json
  def create
    @servico = Servico.new(servico_params)

    respond_to do |format|
      if @servico.save
        format.html { redirect_to @servico, notice: "Servico was successfully created." }
        format.json { render :show, status: :created, location: @servico }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servicos/1 or /servicos/1.json
  def update
    respond_to do |format|
      if @servico.update(servico_params)
        format.html { redirect_to @servico, notice: "Servico was successfully updated." }
        format.json { render :show, status: :ok, location: @servico }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servicos/1 or /servicos/1.json
  def destroy
    @servico.destroy
    respond_to do |format|
      format.html { redirect_to servicos_url, notice: "Servico was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_servico
      @servico = Servico.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def servico_params
      params.require(:servico).permit(:prestador, :tipoServico, :saida, :retorno, :qtd, :peso_saida, :peso_retorno, :totalServico, :ref_peca, :solicitante, :status, :qtdAproduzir, :valorUnitarioServico)
    end
end
