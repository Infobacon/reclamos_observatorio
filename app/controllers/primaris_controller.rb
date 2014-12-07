class PrimarisController < ApplicationController
  before_action :set_primari, only: [:show, :edit, :update, :destroy]

  # GET /primaris
  # GET /primaris.json
  def index
    db = SQLite3::Database.open "./db/development.sqlite3"
    test=db.execute("Select cuenta from compania where compania.nombre_c='Movistar'")
    @mov = test
    test=db.execute("Select cuenta from compania where compania.nombre_c='Claro'")
    @cla=test
    test=db.execute("Select cuenta from compania where compania.nombre_c='Entel'")
    @entel=test
  end

  # GET /primaris/1
  # GET /primaris/1.json
  def show
  end

  # GET /primaris/new
  def new
    @primari = Primari.new
  end

  # GET /primaris/1/edit
  def edit
  end

  # POST /primaris
  # POST /primaris.json
  def create
    @primari = Primari.new(primari_params)

    respond_to do |format|
      if @primari.save
        format.html { redirect_to @primari, notice: 'Primari was successfully created.' }
        format.json { render :show, status: :created, location: @primari }
      else
        format.html { render :new }
        format.json { render json: @primari.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /primaris/1
  # PATCH/PUT /primaris/1.json
  def update
    respond_to do |format|
      if @primari.update(primari_params)
        format.html { redirect_to @primari, notice: 'Primari was successfully updated.' }
        format.json { render :show, status: :ok, location: @primari }
      else
        format.html { render :edit }
        format.json { render json: @primari.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /primaris/1
  # DELETE /primaris/1.json
  def destroy
    @primari.destroy
    respond_to do |format|
      format.html { redirect_to primaris_url, notice: 'Primari was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_primari
      @primari = Primari.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def primari_params
      params[:primari]
    end
end
