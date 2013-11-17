class AddCommentToStash < ActiveRecord::Migration
  def change
    add_column :stashes, :comment, :string
  end
end
