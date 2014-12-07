class CompaniaController < ApplicationController
  before_action :set_companium, only: [:show, :edit, :update, :destroy]

  # GET /compania
  # GET /compania.json
  def index
    @compania = Companium.all
  end

  # GET /compania/1
  # GET /compania/1.json
  def show
  end

  # GET /compania/new
  def new
    @companium = Companium.new
  end

  # GET /compania/1/edit
  def edit
  end

  # POST /compania
  # POST /compania.json
  def create
    @companium = Companium.new(companium_params)

    respond_to do |format|
      if @companium.save
        format.html { redirect_to @companium, notice: 'Companium was successfully created.' }
        format.json { render :show, status: :created, location: @companium }
      else
        format.html { render :new }
        format.json { render json: @companium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compania/1
  # PATCH/PUT /compania/1.json
  def update
    respond_to do |format|
      if @companium.update(companium_params)
        format.html { redirect_to @companium, notice: 'Companium was successfully updated.' }
        format.json { render :show, status: :ok, location: @companium }
      else
        format.html { render :edit }
        format.json { render json: @companium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compania/1
  # DELETE /compania/1.json
  def destroy
    @companium.destroy
    respond_to do |format|
      format.html { redirect_to compania_url, notice: 'Companium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_companium
      @companium = Companium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def companium_params
      params.require(:companium).permit(:nombre_c, :cuenta, :twi)
    end
end
