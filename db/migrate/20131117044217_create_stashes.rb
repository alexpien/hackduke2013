class CreateStashes < ActiveRecord::Migration
  def change
    create_table :stashes do |t|
      t.integer :score
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
