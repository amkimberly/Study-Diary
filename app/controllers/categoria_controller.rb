class CategoriaController < ApplicationController
  before_action :set_categorium, only: [:edit, :update, :destroy]

  # GET /categoria
  # GET /categoria.json
  def index
    @categoria = Categorium.all
  end

  # GET /categoria/1
  # GET /categoria/1.json

  # GET /categoria/new
  def new
    @categorium = Categorium.new
  end

  # GET /categoria/1/edit
  def edit
  end

  # POST /categoria
  # POST /categoria.json
  def create
    @categorium = Categorium.new(categorium_params)
    
    respond_to do |format|
      if @categorium.save
        format.html { redirect_to @categorium, notice: 'Categoria Cadastrada com sucesso!' }
        format.json { render :show, status: :created, location: @categorium }
      else
        format.html { render :new }
        format.json { render json: @categorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categoria/1
  # PATCH/PUT /categoria/1.json
  def update
    respond_to do |format|
      if @categorium.update(categorium_params)
        format.html { redirect_to @categorium, notice: 'Categoria atualizada!' }
        format.json { render :show, status: :ok, location: @categorium }
      else
        format.html { render :edit }
        format.json { render json: @categorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoria/1
  # DELETE /categoria/1.json
  def destroy
    @categorium.destroy
    respond_to do |format|
      format.html { redirect_to categoria_url, notice: 'Categoria removida com sucesso!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categorium
      @categorium = Categorium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def categorium_params
      params.require(:categorium).permit(:nome)
    end
end
