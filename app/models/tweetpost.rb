class Tweetpost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 1500}
  validate :picture_size

  private
    
   def picture_size 
    if picture.size > 5.megabytes
      errors.add(:picture, "画像サイズが大きすぎます")
    end
   end
   
end
