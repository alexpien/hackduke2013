class AddImagePathToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image_path, :string
  end
end
