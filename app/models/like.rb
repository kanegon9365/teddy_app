class Like < ApplicationRecord

  belongs_to :user
  belongs_to :tweetpost
  validates :user_id, presence: true
  validates :tweetpost_id, presence: true
  

  
end
