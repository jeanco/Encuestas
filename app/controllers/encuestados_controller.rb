class EncuestadosController < ApplicationController
  before_filter :authenticate

  def index
    @encuestados = Encuestado.where("login is not null")
  end

  def show
    @encuestado = Encuestado.find params[:id]
  end

  def respuesta_encuesta
    @encuestado = Encuestado.find params[:id]
    @encuesta = Encuesta.find params[:encuesta_id]
    @respuestas = @encuestado.respuestas.where("encuesta_id = ?", params[:encuesta_id])
    @tipo_pregunta_abierta = PreguntaTipo.find_by_nombre("Abierta")
    #render :layout => false
  end
end
