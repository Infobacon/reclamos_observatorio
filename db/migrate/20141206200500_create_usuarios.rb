class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nick
      t.string :nombre_u
      t.integer :id_t

      t.timestamps
    end
  end
end
