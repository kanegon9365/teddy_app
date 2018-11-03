class CreateTweetposts < ActiveRecord::Migration[5.2]
  def change
    create_table :tweetposts do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :tweetposts, [:user_id, :created_at]
  end
end
