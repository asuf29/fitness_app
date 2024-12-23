class Exercise < ApplicationRecord
  has_rich_text :content
  has_one_attached :image

  validate :image_validation

  private

  def image_validation
    if image.attached? && !image.content_type.in?(%('image/jpeg image/png image/gif))
      errors.add(:image, 'must be a JPEG, PNG or GIF')
    end

    if image.attached? && image.byte_size > 5.megabytes
      errors.add(:image, 'size must be less than 5MB')
    end
  end
end
