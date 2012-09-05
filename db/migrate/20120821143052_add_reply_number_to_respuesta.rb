class AddReplyNumberToRespuesta < ActiveRecord::Migration
  def change
    add_column :respuesta, :reply_number, :integer
  end
end
