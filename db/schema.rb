# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141207030153) do

  create_table "compania", force: true do |t|
    t.string   "nombre_c"
    t.integer  "cuenta",     default: 0
    t.string   "twi"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diccionarios", force: true do |t|
    t.text     "Terminos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "filtros", force: true do |t|
    t.string   "tipo"
    t.string   "termino"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "primaris", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reclamos", force: true do |t|
    t.integer  "Tweet_id"
    t.integer  "Compania_id"
    t.string   "tipo"
    t.string   "servicio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reclamos", ["Compania_id"], name: "index_reclamos_on_Compania_id"
  add_index "reclamos", ["Tweet_id"], name: "index_reclamos_on_Tweet_id"

  create_table "tweet_diccionarios", force: true do |t|
    t.integer  "Tweet_id"
    t.integer  "Diccionario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tweet_diccionarios", ["Diccionario_id"], name: "index_tweet_diccionarios_on_Diccionario_id"
  add_index "tweet_diccionarios", ["Tweet_id"], name: "index_tweet_diccionarios_on_Tweet_id"

  create_table "tweet_filtros", force: true do |t|
    t.integer  "Tweet_id"
    t.integer  "Filtro_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tweet_filtros", ["Filtro_id"], name: "index_tweet_filtros_on_Filtro_id"
  add_index "tweet_filtros", ["Tweet_id"], name: "index_tweet_filtros_on_Tweet_id"

  create_table "tweets", force: true do |t|
    t.text     "contenido"
    t.datetime "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuario_tweets", force: true do |t|
    t.integer  "Usuario_id"
    t.integer  "Tweet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuario_tweets", ["Tweet_id"], name: "index_usuario_tweets_on_Tweet_id"
  add_index "usuario_tweets", ["Usuario_id"], name: "index_usuario_tweets_on_Usuario_id"

  create_table "usuarios", force: true do |t|
    t.string   "nick"
    t.string   "nombre_u"
    t.integer  "id_t"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
