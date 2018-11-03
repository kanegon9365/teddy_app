class AddPictureToTweetposts < ActiveRecord::Migration[5.2]
  def change
    add_column :tweetposts, :picture, :string
  end
end
