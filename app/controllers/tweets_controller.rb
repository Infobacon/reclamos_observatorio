class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  def dic_tweet(texto)
    d = Time.now.to_s
    db = SQLite3::Database.open "./db/development.sqlite3"
    id=db.execute("select id from tweets order by id desc limit 1;")
    palabra=texto.split(" ")
    cadena=db.execute("select Terminos from diccionarios")
    ctd=0
        id_f=1
    palabra.each do |i|
          while(ctd<cadena.count)
            if(i==cadena[ctd])
              id_f=db.execute("select id from diccionarios where Terminos=(?) limit 1",i)
              break
            end
            ctd+=1
          end
      ctd=0
    end
    db.execute("insert into tweet_diccionarios('Tweet_id','Diccionario_id','created_at','updated_at') values(?,?,?,?)",id,id_f,d,d)
  end
  def user_tweet(palabra)
    db = SQLite3::Database.open "./db/development.sqlite3"
    id=db.execute("select id from tweets order by id desc limit 1;")
    id_u=db.execute("select id from usuarios where id_t=(?);",[palabra.user.id])
    d = Time.now.to_s
    db.execute( "INSERT INTO usuario_tweets(usuario_id,tweet_id,'created_at','updated_at') values (?,?,?,?)", id,id_u,d,d)
  end
  def insert_tweet(palabra)
    db = SQLite3::Database.open "./db/development.sqlite3"
    #db.execute( "INSERT INTO Tweet(
    #     	'Contenido','fecha','id_diccionario') values(?,?,?)", [palabra.text],[palabra.created_at],1)
    d = Time.now.to_s
    db.execute( "INSERT INTO Tweets(
          	'Contenido','fecha','created_at','updated_at') values(?,?,?,?)", [palabra.text],d,d,d)
  end
  def insert_usuario(palabra)
    d = Time.now.to_s
    db = SQLite3::Database.open "./db/development.sqlite3"
    if db.execute("select id_t from usuarios where id_t=(?)",[palabra.user.id])!=0
      db.execute( "INSERT INTO Usuarios(
		      	'Id_t','Nick','Nombre_u','created_at','updated_at') values(?,?,?,?,?)", [palabra.user.id],[palabra.user.screen_name],[palabra.user.name],d,d)
    end
  end
  def reclamo(texto)
    d = Time.now.to_s
    db = SQLite3::Database.open "./db/development.sqlite3"
    id=db.execute("select id from tweets order by id desc limit 1;")
    id_e=0
    i=" "
    tipo="otros"
    servicio="incierto"
    cadena=db.execute("select tipo,termino from filtros")
    palabra=texto.split(" ")
    ctd=0
    id_f=1
    palabra.each do |i|
      while ctd<cadena.count
        if (i==cadena[ctd][1])
          tipo=cadena[ctd][0]
          id_f=db.execute("select id from filtros where termino=(?)",cadena[ctd][0])
          break
        end
        ctd+=1
      end
      ctd=0
    end
    palabra.each do |i|
      if (i=="celular")
        servicio="celular"
      end
      if (i=="telefono")
        servicio="hogar"
      end
    end
    db.execute("insert into tweet_filtros('Tweet_id','Filtro_id','created_at','updated_at') values(?,?,?,?)",id,id_f,d,d)
    palabra.each do |i|
      if (i.start_with?("@e"))
        id_e=db.execute("select id from companias where companias.twi='entel_ayuda' limit 1")
      end
      if (i.start_with?("@C"))
        id_e=db.execute("select id from companias where companias.twi='ClaroTeAyuda' limit 1")
      end
      if (i.start_with?("@A"))
        id_e=db.execute("select id from companias where companias.twi='AyudaMovistarCL' limit 1")
      end
    end
    db.execute("insert into reclamos (tweet_id,compania_id,tipo,servicio,'created_at','updated_at') values(?,?,?,?,?,?)",id,id_e,tipo,servicio,d,d)
  end
  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    require 'sqlite3'
    require 'twitter'
    db = SQLite3::Database.open "./db/development.sqlite3"
    client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = "6lbKKtoGUNt1HqmXp5OTfpnSu"
      config.consumer_secret     = "m0rkrkbmn5sDuXcJFBSJRmrzcEYEBXx95k80nH738JrxdFpl7h"
      config.access_token        = "777522674-swQ5cJqfqSnzf2CCJgDSWLaVkRpr5XogBmyKCQGJ"
      config.access_token_secret = "MQuAZO0kJ4JGxTNYQlsdLgRN02RYHChpMLOBQZt6aRMWv"
    end
    #topics = ["entel_ayuda celular","AyudaMovistarCL celular", "ClaroTeAyuda celular",
              #"entel_ayuda señal","AyudaMovistarCL señal", "ClaroTeAyuda señal",
              #"entel_ayuda telefono","AyudaMovistarCL telefono", "ClaroTeAyuda telefono",
              #"entel_ayuda problema","AyudaMovistarCL problema", "ClaroTeAyuda problema",
              #"entel_ayuda iphone","AyudaMovistarCL iphone", "ClaroTeAyuda iphone",
              #"entel_ayuda reclamo","AyudaMovistarCL reclamo", "ClaroTeAyuda reclamo",
              #"entel_ayuda 3G","AyudaMovistarCL 3G", "ClaroTeAyuda 3G"]
    topics=db.execute("select terminos from diccionarios")
    contador = 0
    #@tweets = []
    client.filter(:track => topics.join(",")) do |object|
      if contador >= 1
        break
      else
        insert_tweet(object)
        insert_usuario(object)
        reclamo(object.text)
        user_tweet(object)
        dic_tweet(object.text)
        #@tweets.push contador
        #@tweets = object.text if object.is_a?(Twitter::Tweet)
      end
      contador += 1
    end
    #@tweet = Tweet.new
    @tweets = Tweet.all
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json
  def create
    #@tweet = Tweet.new(tweet_params)


  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:contenido, :fecha)
    end
end
