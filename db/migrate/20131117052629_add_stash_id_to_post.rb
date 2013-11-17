class AddStashIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :stash_id, :integer
  end
end
