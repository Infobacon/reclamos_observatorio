class FiltrosController < ApplicationController
  before_action :set_filtro, only: [:show, :edit, :update, :destroy]

  # GET /filtros
  # GET /filtros.json
  def index
    @filtros = Filtro.all
  end

  # GET /filtros/1
  # GET /filtros/1.json
  def show
  end

  # GET /filtros/new
  def new
    @filtro = Filtro.new
  end

  # GET /filtros/1/edit
  def edit
  end

  # POST /filtros
  # POST /filtros.json
  def create
    @filtro = Filtro.new(filtro_params)

    respond_to do |format|
      if @filtro.save
        format.html { redirect_to @filtro, notice: 'Filtro was successfully created.' }
        format.json { render :show, status: :created, location: @filtro }
      else
        format.html { render :new }
        format.json { render json: @filtro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /filtros/1
  # PATCH/PUT /filtros/1.json
  def update
    respond_to do |format|
      if @filtro.update(filtro_params)
        format.html { redirect_to @filtro, notice: 'Filtro was successfully updated.' }
        format.json { render :show, status: :ok, location: @filtro }
      else
        format.html { render :edit }
        format.json { render json: @filtro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /filtros/1
  # DELETE /filtros/1.json
  def destroy
    @filtro.destroy
    respond_to do |format|
      format.html { redirect_to filtros_url, notice: 'Filtro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_filtro
      @filtro = Filtro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def filtro_params
      params.require(:filtro).permit(:tipo, :termino)
    end
end
