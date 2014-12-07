class CreateReclamos < ActiveRecord::Migration
  def change
    create_table :reclamos do |t|
      t.references :Tweet, index: true
      t.references :Compania, index: true
      t.string :tipo
      t.string :servicio

      t.timestamps
    end
  end
end
