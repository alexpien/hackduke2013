class AddCommentToPost < ActiveRecord::Migration
  def change
    add_column :posts, :comment, :string
  end
end
