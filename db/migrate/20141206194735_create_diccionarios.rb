class CreateDiccionarios < ActiveRecord::Migration
  def change
    create_table :diccionarios do |t|
      t.text :Terminos

      t.timestamps
    end
  end
end
