class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t| 
      t.string :title
      t.string :baby_id
      t.integer :user_id
      t.integer :weight 
      t.integer :height 
      t.string :summary
      t.timestamps 
    end
  end
end
