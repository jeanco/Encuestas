class AddEncuestaIdToRespuesta < ActiveRecord::Migration
  def change
    add_column :respuesta, :encuesta_id, :integer
  end
end
