class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweetpost
  validates :content, presence: true
end
