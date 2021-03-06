class CreateBabies < ActiveRecord::Migration[6.1]
  def change
    create_table :babies do |t|
      t.string :name 
      t.integer :age 
      t.integer :user_id 
      t.string :gender
    end
  end
end
