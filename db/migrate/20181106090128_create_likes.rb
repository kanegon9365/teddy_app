class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :tweetpost_id

      t.timestamps
    end
    add_index :likes, :user_id
    add_index :likes, :tweetpost_id
    add_index :likes, [:user_id, :tweetpost_id], unique: true
  end
end
