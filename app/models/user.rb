class User < ApplicationRecord
  has_many :following_users, class_name: "Fellowship", foreign_key: :followee_id, inverse_of: :followee
  has_many :followers, through: :following_users, dependent: :destroy

  has_many :followed_users, class_name: "Fellowship", foreign_key: :follower_id, inverse_of: :follower
  has_many :followees, through: :followed_users, dependent: :destroy

  has_many :posts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
