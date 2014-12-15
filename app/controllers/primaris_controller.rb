class PrimarisController < ApplicationController
  before_action :set_primari, only: [:show, :edit, :update, :destroy]

  # GET /primaris
  # GET /primaris.json
  def index
    db = SQLite3::Database.open "./db/development.sqlite3"
    test=db.execute("Select cuenta from compania where compania.nombre_c='Movistar'")[0]
    @mov = test
    test=db.execute("Select cuenta from compania where compania.nombre_c='Claro'")[0]
    @cla=test
    test=db.execute("Select cuenta from compania where compania.nombre_c='Entel'")[0]
    @entel=test
    test=db.execute("Select nombre_c from compania order by cuenta desc limit 1")[0]
    @dat1=test
    test=db.execute("Select nombre_c from compania order by cuenta asc limit 1")[0]
    @dat2=test
    hola=db.execute("Select tipo,count(tipo) as cuenta from reclamos where reclamos.tipo!='otros' group by tipo order by cuenta desc limit 1")
    hola=hola.to_s.tr("X-\\][", "")
    hola=hola.split(',')
    hola.pop
    test=hola
    @dat3=test
    hola=db.execute("Select servicio,count(tipo) as cuenta from reclamos group by servicio order by cuenta desc limit 1")
    hola=hola.to_s.tr("X-\\][", "")
    hola=hola.split(',')
    hola.pop
    test=hola
    @dat4=test
    hola=db.execute("Select nombre_u,Usuario_id,count(Usuario_id) as cuenta from usuario_tweets join usuarios where usuario_tweets.Usuario_id=usuarios.id group by nombre_u order by cuenta desc limit 1")
    hola=hola.to_s.tr("X-\\][", "")
    hola=hola.split(',')
    hola=hola[0]+" con "+hola[2]+" reclamos"
    hola=[hola]
    test=hola
    @dat5=test
    hola=db.execute("Select Terminos,count(Diccionario_id) as cuenta from tweet_diccionarios join diccionarios where tweet_diccionarios.Diccionario_id=diccionarios.id group by Terminos order by cuenta desc limit 1")
    hola=hola.to_s.tr("X-\\][", "")
    hola=hola.split(',')
    hola.pop
    #hola=hola.to_s
    #hola=hola.split
    #hola.delete_at(0)
    test=hola
    @dat6=test
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
