class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  default_scope { order(created_at: :desc) }

  has_one_attached :image

  validates :body, length: { maximum: 280 }

  validate :body_or_image_presence

  validate :upload_is_image

  private

  def upload_is_image
    unless image and image.content_type =~ /^image\/(jpeg|pjpeg|gif|png|bmp)$/
      errors.add(:upload, "is not a valid image") if image.attached?
    end
  end

  def body_or_image_presence
    errors.add(:base, 'Post must have either body or image') unless body.present? || image.attached?
  end
end
