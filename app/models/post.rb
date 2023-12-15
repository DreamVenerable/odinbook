class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments

  validates :title, presence: true, length: { maximum: 40 }
  validates :body, length: { maximum: 280 }
end
