class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :title, presence: true
  validates :body, length: { maximum: 280 }
end
