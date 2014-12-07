class CreateTweetFiltros < ActiveRecord::Migration
  def change
    create_table :tweet_filtros do |t|
      t.references :Tweet, index: true
      t.references :Filtro, index: true

      t.timestamps
    end
  end
end
