class Tweetpost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 1000}
  validates :picture, presence: true
  validate :picture_size



  #  現在のユーザーが即にいいねをしていればtrue
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  private
    
  def picture_size 
    if picture.size > 5.megabytes
      errors.add(:picture, "画像サイズが大きすぎます")
    end
  end

  
  
  
   
end
