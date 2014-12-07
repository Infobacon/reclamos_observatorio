class CreateCompania < ActiveRecord::Migration
  def change
    create_table :compania do |t|
      t.string :nombre_c
      t.integer :cuenta , :default=>0
      t.string :twi

      t.timestamps
    end
  end
end
