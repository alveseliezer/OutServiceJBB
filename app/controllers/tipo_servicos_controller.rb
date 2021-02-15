class TipoServicosController < ApplicationController
  before_action :set_tipo_servico, only: %i[ show edit update destroy ]

  # GET /tipo_servicos or /tipo_servicos.json
  def index
    @tipo_servicos = TipoServico.all
  end

  # GET /tipo_servicos/1 or /tipo_servicos/1.json
  def show
  end

  # GET /tipo_servicos/new
  def new
    @tipo_servico = TipoServico.new
  end

  # GET /tipo_servicos/1/edit
  def edit
  end

  # POST /tipo_servicos or /tipo_servicos.json
  def create
    @tipo_servico = TipoServico.new(tipo_servico_params)

    respond_to do |format|
      if @tipo_servico.save
        format.html { redirect_to @tipo_servico, notice: "Tipo servico was successfully created." }
        format.json { render :show, status: :created, location: @tipo_servico }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tipo_servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_servicos/1 or /tipo_servicos/1.json
  def update
    respond_to do |format|
      if @tipo_servico.update(tipo_servico_params)
        format.html { redirect_to @tipo_servico, notice: "Tipo servico was successfully updated." }
        format.json { render :show, status: :ok, location: @tipo_servico }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tipo_servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_servicos/1 or /tipo_servicos/1.json
  def destroy
    @tipo_servico.destroy
    respond_to do |format|
      format.html { redirect_to tipo_servicos_url, notice: "Tipo servico was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_servico
      @tipo_servico = TipoServico.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tipo_servico_params
      params.require(:tipo_servico).permit(:tipo_Servico, :valorUnitario, :valorTotal, :references)
    end
end
