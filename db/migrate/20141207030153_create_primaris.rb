class CreatePrimaris < ActiveRecord::Migration
  def change
    create_table :primaris do |t|

      t.timestamps
    end
  end
end
