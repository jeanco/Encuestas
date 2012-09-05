class Encuestado < ActiveRecord::Base
  has_many :respuestas
  has_many :preguntas_contestadas, :class_name => "Pregunta", :through => :respuestas, :source => :pregunta, :uniq => true
  has_many :encuestas_contestadas, :class_name => "Encuesta", :through => :preguntas_contestadas, :source => :encuesta
end
