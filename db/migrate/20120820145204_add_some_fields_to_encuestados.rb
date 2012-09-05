class AddSomeFieldsToEncuestados < ActiveRecord::Migration
  def change
    add_column :encuestados, :login, :string
    add_column :encuestados, :email, :string
    add_column :encuestados, :nombre, :string
  end
end
