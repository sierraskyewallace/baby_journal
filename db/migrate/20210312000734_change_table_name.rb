class ChangeTableName < ActiveRecord::Migration[6.1]
  def self.up
    rename_table :updates, :posts
  end

  def self.down
    rename_table :posts, :updates
  end
end