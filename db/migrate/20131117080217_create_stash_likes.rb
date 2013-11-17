class CreateStashLikes < ActiveRecord::Migration
  def change
    create_table :stash_likes do |t|
      t.integer :user_id
      t.integer :stash_id

      t.timestamps
    end
  end
end
