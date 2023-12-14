class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, length: { maximum: 280 }
end
