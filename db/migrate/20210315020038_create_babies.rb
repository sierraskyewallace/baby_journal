class CreateBabies < ActiveRecord::Migration[6.1]
  def change
    create_table :babies do |t|
      t.string :name 
      t.integer :age 
      t.string :gender 
      t.integer :user_id
    end
  end
end
