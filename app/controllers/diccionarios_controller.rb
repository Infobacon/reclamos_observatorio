class DiccionariosController < ApplicationController
  before_action :set_diccionario, only: [:show, :edit, :update, :destroy]

  # GET /diccionarios
  # GET /diccionarios.json
  def index
    @diccionarios = Diccionario.all
  end

  # GET /diccionarios/1
  # GET /diccionarios/1.json
  def show
  end

  # GET /diccionarios/new
  def new
    @diccionario = Diccionario.new
  end

  # GET /diccionarios/1/edit
  def edit
  end

  # POST /diccionarios
  # POST /diccionarios.json
  def create
    @diccionario = Diccionario.new(diccionario_params)

    respond_to do |format|
      if @diccionario.save
        format.html { redirect_to @diccionario, notice: 'Diccionario was successfully created.' }
        format.json { render :show, status: :created, location: @diccionario }
      else
        format.html { render :new }
        format.json { render json: @diccionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diccionarios/1
  # PATCH/PUT /diccionarios/1.json
  def update
    respond_to do |format|
      if @diccionario.update(diccionario_params)
        format.html { redirect_to @diccionario, notice: 'Diccionario was successfully updated.' }
        format.json { render :show, status: :ok, location: @diccionario }
      else
        format.html { render :edit }
        format.json { render json: @diccionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diccionarios/1
  # DELETE /diccionarios/1.json
  def destroy
    @diccionario.destroy
    respond_to do |format|
      format.html { redirect_to diccionarios_url, notice: 'Diccionario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diccionario
      @diccionario = Diccionario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diccionario_params
      params.require(:diccionario).permit(:Terminos)
    end
end
