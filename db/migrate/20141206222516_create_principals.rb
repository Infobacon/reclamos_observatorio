class CreatePrincipals < ActiveRecord::Migration
  def change
    create_table :principals do |t|

      t.timestamps
    end
  end
end
