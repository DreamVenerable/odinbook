class User < ApplicationRecord
  has_many :following_users, class_name: "Fellowship", foreign_key: :followee_id, inverse_of: :followee
  has_many :followers, through: :following_users, dependent: :destroy

  has_many :followed_users, class_name: "Fellowship", foreign_key: :follower_id, inverse_of: :follower
  has_many :followees, through: :followed_users, dependent: :destroy

  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :comments

  validates :username, uniqueness: true

  before_create :set_default_avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]


  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.username = auth.info.name
      user.image_url = auth.info.image
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def set_default_avatar
    self.image_url ||= 'default_avatar.jpg'
  end
end
