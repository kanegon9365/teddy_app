class User < ApplicationRecord
  
  
  has_many :tweetposts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  # active_relationshipsの関係性を作るためにrelationshipモデルを使用すると明示している.foreign_keyによりfollower_idとidが繋がる.
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  # followingシンボルを用いたいのでfollowedを示しそこからfollowed_idを取得する.
  has_many :following, through: :active_relationships, source: :followed

  # followed_idとuserモデルのidとの関連性を明示
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  before_save { self.email = email.downcase }
  mount_uploader :picture, PictureUploader
  validates :name, presence: true, length:{ maximum: 20 }
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length:{ maximum: 50 },
                    format: { with: VALID_EMAIL },
                    # 大文字小文字の型を無視する
                    uniqueness: { case_sensitive: false }
  validates :profile, length:{ maximum: 300 }
  has_secure_password
  validates :password, presence: true, length:{ minimum: 6}
  validate :picture_size
  mount_uploader :picture, PictureUploader


  # フォローしているユーザーの投稿を取得
  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id"
    Tweetpost.where("user_id IN (#{following_ids})
                     OR user_id = :user_id", user_id: id)
  end
   
  # 引数に与えられたユーザーidをfollowed_idに追加する
  def follow(other_user)
    following << other_user
  end


  # 引数に与えられたユーザーidをfollowed_idから探し出し存在すれば削除
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # other_userがfollowed_idに存在するか確認するメソッと
  def following?(other_user)
    following.include?(other_user)
  end

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

  

end
