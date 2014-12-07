class CreateTweetDiccionarios < ActiveRecord::Migration
  def change
    create_table :tweet_diccionarios do |t|
      t.references :Tweet, index: true
      t.references :Diccionario, index: true

      t.timestamps
    end
  end
end
