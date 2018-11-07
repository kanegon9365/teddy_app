class Tweetpost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :do_like_users, through: :likes, source: :user
  
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 1500}
  validate :picture_size



  #  現在のユーザーが即にいいねをしていればtrue
  def like?(user)
    do_like_users.include?(user)
  end

  #  いいねを作成する
   def do_like(user)
    likes.create(user_id: user.id)
   end

  #  いいねを取り消す
   def do_unlike(user)
    likes.find_by(user_id: user.id).destroy
   end


  private
    
   def picture_size 
    if picture.size > 5.megabytes
      errors.add(:picture, "画像サイズが大きすぎます")
    end
   end

  
  
  
   
end
