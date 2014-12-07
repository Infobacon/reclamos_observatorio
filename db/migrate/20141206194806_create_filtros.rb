class CreateFiltros < ActiveRecord::Migration
  def change
    create_table :filtros do |t|
      t.string :tipo
      t.string :termino

      t.timestamps
    end
  end
end
