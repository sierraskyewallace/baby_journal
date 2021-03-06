class CreateUpdates < ActiveRecord::Migration[6.1]
  def change
    create_table :updates do |t| 
      t.integer :weight 
      t.integer :height 
      t.string :summary
      t.integer :baby_id
      t.timestamps 
    end
  end
end
