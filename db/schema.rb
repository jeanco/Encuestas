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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120821143052) do

  create_table "encabezados", :force => true do |t|
    t.integer  "encuesta_id"
    t.text     "texto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "encuesta", :force => true do |t|
    t.integer  "creador_id"
    t.string   "nombre"
    t.text     "descripcion"
    t.text     "presentacion"
    t.datetime "fecha_creacion"
    t.datetime "fecha_inicio"
    t.datetime "fecha_fin"
    t.boolean  "activa"
    t.boolean  "autenticada"
    t.integer  "campos_numerados"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "concurrencia"
    t.boolean  "resultados_publicos"
    t.date     "limite_contestar"
    t.boolean  "login"
  end

  add_index "encuesta", ["creador_id"], :name => "index_encuesta_on_creador_id"

  create_table "encuestados", :force => true do |t|
    t.string   "session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login"
    t.string   "email"
    t.string   "nombre"
  end

  create_table "footers", :force => true do |t|
    t.integer  "encuesta_id"
    t.string   "texto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opcion_tipos", :force => true do |t|
    t.string   "tipo"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opciones", :force => true do |t|
    t.integer  "pregunta_id"
    t.string   "contenido"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pregunta", :force => true do |t|
    t.integer  "encuesta_id"
    t.integer  "tema_id"
    t.integer  "pregunta_tipo_id"
    t.text     "texto"
    t.boolean  "activa"
    t.integer  "order"
    t.string   "orientacion",      :limit => 3
    t.integer  "min_opc_select"
    t.integer  "max_opc_select"
    t.boolean  "requerido"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "opcional"
  end

  create_table "pregunta_tipos", :force => true do |t|
    t.string   "nombre",      :limit => 50
    t.string   "descripcion", :limit => 300
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "respuesta", :force => true do |t|
    t.integer  "encuestado_id"
    t.integer  "pregunta_id"
    t.integer  "opcion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "texto"
    t.integer  "encuesta_id"
    t.integer  "reply_number"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "temas", :force => true do |t|
    t.integer  "encuesta_id"
    t.integer  "orden"
    t.string   "tema",        :limit => 400
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "temas", ["encuesta_id"], :name => "index_temas_on_encuesta_id"

  create_table "usuario_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "login",               :limit => 100
    t.string   "apellido_paterno",    :limit => 100
    t.string   "apellido_materno",    :limit => 100
    t.date     "fecha_alta",                         :default => '2012-09-09'
    t.string   "email",               :limit => 100
    t.string   "persistence_token",                                            :null => false
    t.string   "crypted_password",                                             :null => false
    t.string   "password_salt",                                                :null => false
    t.string   "single_access_token",                                          :null => false
    t.string   "perishable_token",                                             :null => false
    t.integer  "login_count",                        :default => 0,            :null => false
    t.integer  "failed_login_count",                 :default => 0,            :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "roles",                              :default => "--- []"
  end

end
