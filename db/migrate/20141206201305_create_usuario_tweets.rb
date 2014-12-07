class CreateUsuarioTweets < ActiveRecord::Migration
  def change
    create_table :usuario_tweets do |t|
      t.references :Usuario, index: true
      t.references :Tweet, index: true

      t.timestamps
    end
  end
end
